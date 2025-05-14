import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  void sendResetLink() {
    final email = emailController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      Get.snackbar("Error", "Please enter a valid email address");
      return;
    }

    // Simulasi pengiriman link reset (bisa diganti dengan API call)
    Get.snackbar("Success", "Reset link sent to $email");

    // Navigasi ke halaman new password
    Future.delayed(const Duration(milliseconds: 800), () {
      Get.toNamed('/new-password');
    });
  }

  void goToSignUp() {
    Get.toNamed('/signup');
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
