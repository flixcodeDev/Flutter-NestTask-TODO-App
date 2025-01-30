import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../CustomButton/BottomNavBar.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  Future<void> register(
      {required String email, required String password}) async {
    try {
      isLoading.value = true;

      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        Get.snackbar("Success", "Registration successful",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
        Get.offAll(() => const Bottomnavbar());
      } else {
        Get.snackbar("Error", "Registration failed. Please try again.",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      }
    } on AuthException catch (e) {
      if (e.message.contains("Invalid login credentials")) {
        Get.snackbar("Error", "The email already exists.",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      } else {
        Get.snackbar(
            "Auth Error", "Authentication Error, Please try again Later.",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      }
    } on SocketException {
      Get.snackbar("Network Error", "No Internet Connection",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    } on TimeoutException {
      Get.snackbar("Timeout", "Request Timed Out",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    } catch (e) {
      Get.snackbar("Error", "Something Went Wrong",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      debugPrint("Error: $e");
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
