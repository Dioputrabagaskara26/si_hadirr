import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

void signUp() {
    // Tambahkan validasi & simpan data jika perlu

    // Navigasi ke halaman login setelah berhasil sign up
    Get.offAllNamed('/login'); // Gunakan Get.toNamed jika tidak ingin menghapus history
  }

  void goToLogin() {
    Get.toNamed('/login');
  }
}