import 'package:flutter/material.dart';
import 'package:get/get.dart';


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

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _sectionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CustomTextField(
            controller: _emailController,
            hintText: "DIU_Email",
            prefixIcon: Icon(
              Icons.mail_outline_outlined,
              color: Colors.deepPurpleAccent,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomTextField(
            controller: _passwordController,
            hintText: "Password",
            prefixIcon: Icon(
              Icons.lock_outlined,
              color: Colors.deepPurpleAccent,
            ),
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
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  }),
              Text(
                "Remember Me",
                style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomButton(
              onTap: () {
                Get.to(Bottomnavbar());
              },
              text: "Login",
              fontsize: 18,
              textcolor: Colors.white,
              bgcolor: Colors.deepPurpleAccent,
              btnheight: MediaQuery.of(context).size.height * 0.07,
              btnwidth: MediaQuery.of(context).size.width * 9)
        ],
      );

  }
}
