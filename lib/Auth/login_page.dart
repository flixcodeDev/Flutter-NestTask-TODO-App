import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesttask/Auth/controllers/login_controller.dart';

import '../CustomButton/BottomNavBar.dart';
import '../CustomButton/CustomTextField.dart';
import '../CustomButton/customButton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  final _key = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _sectionController = TextEditingController();

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

              // if (!isValidEmail(value)) {
              //   return "Please Enter DIU Provided Email.";
              // }
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
            controller: _sectionController,
            hintText: "Section",
            prefixIcon: Icon(
              Icons.people_alt_outlined,
              color: Colors.deepPurpleAccent,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Fields Can't be empty";
              }

              return null;
            },
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          TextButton(
              onPressed: () {},
              child: Text(
                "Forget Password ?",
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Obx(() {
            return CustomButton(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    loginController.login(
                        email: _emailController.text,
                        password: _passwordController.text);
                  }
                },
                text: loginController.isLoading.value ? "Loading..." : "Login",
                fontsize: 18,
                textcolor: Colors.white,
                bgcolor: Colors.deepPurpleAccent,
                btnheight: MediaQuery.of(context).size.height * 0.07,
                btnwidth: MediaQuery.of(context).size.width * 9);
          })
        ],
      ),
    );
  }
}
