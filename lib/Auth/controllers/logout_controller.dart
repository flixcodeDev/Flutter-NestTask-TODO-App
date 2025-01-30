import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesttask/Auth/AuthPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../CustomButton/BottomNavBar.dart';

class LogoutController extends GetxController {
  Future<void> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
      Get.offAll(Authpage());
    } on AuthException catch (e) {
      Get.snackbar(
          "Auth Error", "Authentication Error, Please try again Later.",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);

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
    }
  }
}
