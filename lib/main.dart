import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesttask/App_Pages/SearchPage.dart';
import 'package:nesttask/App_Pages/UpcomingTask.dart';
import 'package:nesttask/Auth/AuthPage.dart';


import 'package:nesttask/CustomButton/BottomNavBar.dart';

import 'package:nesttask/StartScreen.dart';

import 'App_Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Nest Task",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:Authpage(),
      //sakib
    );
  }
}
