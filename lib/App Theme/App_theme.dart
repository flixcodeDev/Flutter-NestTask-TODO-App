import 'package:flutter/material.dart';
import 'package:nesttask/App%20Theme/Custom_Colors.dart';



//var lightTheme = ThemeData();
var lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
    headlineLarge: TextStyle(
    fontSize: 36,
    color: AppColors.secondaryBlackColor,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
fontSize: 32,
color: AppColors.whiteColor
)));


