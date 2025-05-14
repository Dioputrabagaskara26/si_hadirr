import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() {
    // Di sini kamu bisa menambahkan validasi login atau autentikasi

    // Untuk saat ini langsung navigasi ke halaman Home
    Get.offAllNamed('/home'); // Menghapus semua halaman sebelumnya, langsung ke Home
  }

  void goToForgotPassword() {
    Get.toNamed('/forgot-password');
  }
}
