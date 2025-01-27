import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nesttask/Auth/AuthPage.dart';

import 'CustomButton/customButton.dart';

class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

  @override
  State<Startscreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<Startscreen> {
  @override
  build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: 250,
                  image: AssetImage('assets/images/avater.png'),
                ),
                Text(
                  'Task Management\n      To-Do List',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Simplifying academic task Management helps\nstudents and administrators collaborate better\nmanage assignment and communicate due dates ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                CustomButton(
                  bgcolor: Colors.deepPurpleAccent,
                  onTap: () {
                    Get.to(Authpage());
                  },
                  text: "Let's Start",
                  btnheight: MediaQuery.of(context).size.height * 0.07,
                  btnwidth: MediaQuery.of(context).size.width * 9,
                  fontsize: 18,
                  textcolor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
