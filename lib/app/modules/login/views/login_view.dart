import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF5),
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            decoration: const BoxDecoration(
              color: Color(0xFF2F5D8A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28,
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
                const Text("Username Or Email"),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: "skyler969@gmail.com",
                    filled: true,
                    fillColor: const Color(0xFFC6D9F4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Password"),
                const SizedBox(height: 8),
                Obx(() => TextField(
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFC6D9F4),
                        suffixIcon: IconButton(
                          icon: Icon(controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
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
                          horizontal: 80, vertical: 15),
                    ),
                    onPressed: controller.login,
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Color(0xFFF0D7A3)),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: controller.goToForgotPassword,
                    child: const Text("Forgot Password?"),
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
