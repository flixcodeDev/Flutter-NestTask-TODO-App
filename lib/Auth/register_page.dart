import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../CustomButton/BottomNavBar.dart';
import '../CustomButton/CustomTextField.dart';
import '../CustomButton/customButton.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _usernameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _sectionController = TextEditingController();

  final instance = Supabase.instance;

  final _key = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Form(
      key: _key,
      child: Column(

        children: [

          CustomTextField(
            controller: _usernameController,
            hintText: "Full Name",
            prefixIcon: Icon(
              Icons.person_2_outlined,
              color: Colors.deepPurpleAccent,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Fields Can't be empty";
              }

              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomTextField(
            controller: _emailController,
            hintText: "DIU_Email",
            prefixIcon: Icon(
              Icons.mail_outline_outlined,
              color: Colors.deepPurpleAccent,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Fields Can't be empty";
              }
              String emailPattern = r'^[a-z]+[0-9]+@diu\.edu\.bd$';

              bool isValidEmail(String email) {
                final regex = RegExp(emailPattern);
                return regex.hasMatch(email);
              }

              if (!isValidEmail(value)) {
                return "Please Enter DIU Provided Email.";
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomTextField(
            controller: _passwordController,
            hintText: "Password",
            prefixIcon: Icon(
              Icons.lock_outlined,
              color: Colors.deepPurpleAccent,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Fields Can't be empty";
              }

              if (value.length < 6) {
                return 'please enter password greater than 6 char';
              }

              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomTextField(
            controller: _phoneController,
            hintText: "Phone Number",
            prefixIcon: Icon(
              Icons.call_outlined,
              color: Colors.deepPurpleAccent,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Fields Can't be empty";
              }
              if (value.length <= 10) {
                return 'please enter valid mobile number';
              }

              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomTextField(
            controller: _sectionController,
            hintText: "Section",
            prefixIcon: Icon(
              Icons.people_alt_outlined,
              color: Colors.deepPurpleAccent,
            ),
            suffixIcon: Icon(Icons.arrow_drop_down),
            validator: (value) {
              if (value!.isEmpty) {
                return "Fields Can't be empty";
              }

              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomButton(
              onTap: () async {
                if (_key.currentState!.validate()) {
                  try {
                    isLoading = true;

                    final response = await instance.client.auth
                        .signInWithPassword(
                        password: _passwordController.text,
                        email: _emailController.text);
                    if (response.user != null) {
                      isLoading = false;
                      Get.off(const Bottomnavbar());
                    }
                  } on SocketException {
                    Get.snackbar("Error", "No Internet");
                    isLoading = false;
                    print("Network Issue");
                  } on TimeoutException {
                    Get.snackbar("Error", "Time Out");
                    isLoading = false;
                  } catch (e) {
                    isLoading = false;
                    Get.snackbar("Error", "Something Went Wrong");
                    print(isLoading);
                    print(e);
                  }
                }
              },
              text: isLoading ? "Loading..." : "Register",
              fontsize: 18,
              textcolor: Colors.white,
              bgcolor: Colors.deepPurpleAccent,
              btnheight: MediaQuery.of(context).size.height * 0.07,
              btnwidth: MediaQuery.of(context).size.width * 9)
        ],
      ) ,

    );
  }
}
