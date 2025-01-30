import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../CustomButton/BottomNavBar.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;

      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        Get.snackbar("Success", "Login successful",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
        Get.offAll(() => const Bottomnavbar());
      }
    } on AuthException catch (e) {
      if (e.message.contains("Invalid login credentials")) {
        Get.snackbar("Login Failed", "Incorrect email or password.",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      } else if (e.message.contains("User not found")) {
        Get.snackbar("User Not Found", "No account exists with this email.",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      } else {
        Get.snackbar(
            "Auth Error", "Authentication Error, Please try again Later.",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      }
      debugPrint("Auth Error: ${e.message}");
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
    } finally {
      isLoading.value = false;
    }
  }
}
