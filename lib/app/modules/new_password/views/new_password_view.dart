import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    InputDecoration fieldDecoration(String hintText) => InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFC6D9F4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              hintText == 'New Password'
                  ? controller.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility
                  : controller.isConfirmPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
            ),
            onPressed: hintText == 'New Password'
                ? controller.togglePasswordVisibility
                : controller.toggleConfirmPasswordVisibility,
          ),
        );

    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF5),
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: const BoxDecoration(
              color: Color(0xFF2F5D8A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              "New Password",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF0D7A3),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("New Password"),
                const SizedBox(height: 8),
                Obx(() => TextField(
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      decoration: fieldDecoration("New Password"),
                    )),
                const SizedBox(height: 16),
                const Text("Confirm New Password"),
                const SizedBox(height: 8),
                Obx(() => TextField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.isConfirmPasswordHidden.value,
                      decoration: fieldDecoration("Confirm New Password"),
                    )),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F5D8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                    ),
                    onPressed: controller.changePassword,
                    child: const Text(
                      "Change Password",
                      style: TextStyle(color: Color(0xFFF0D7A3)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
