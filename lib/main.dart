import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesttask/StartScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://prkqymuorlngepgwgjiv.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBya3F5bXVvcmxuZ2VwZ3dnaml2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgwMDEzNDAsImV4cCI6MjA1MzU3NzM0MH0.JEnzZLxV3yZrLwXZGGV1EFEWl8x1BS8iE2uzkqiKQ1Y");
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
      home: Startscreen(),
    );
  }
}
