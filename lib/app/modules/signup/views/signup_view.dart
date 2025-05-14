import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

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
        );

    return Scaffold(
      backgroundColor: const Color(0xFFEFFFF5),
      body: SingleChildScrollView(
        child: Column(
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
                "Create Account",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF0D7A3),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Full Name"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller.fullNameController,
                    decoration: fieldDecoration("example@example.com"),
                  ),
                  const SizedBox(height: 16),
                  const Text("Email"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller.emailController,
                    decoration: fieldDecoration("example@example.com"),
                  ),
                  const SizedBox(height: 16),
                  const Text("Mobile Number"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller.phoneController,
                    decoration: fieldDecoration("+123 456 789"),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  const Text("Date Of Birth"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller.dobController,
                    decoration: fieldDecoration("DD / MM / YYY"),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 16),
                  const Text("Password"),
                  const SizedBox(height: 8),
                  Obx(() => TextField(
                        controller: controller.passwordController,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: fieldDecoration("••••••••").copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                      )),
                  const SizedBox(height: 16),
                  const Text("Confirm Password"),
                  const SizedBox(height: 8),
                  Obx(() => TextField(
                        controller: controller.confirmPasswordController,
                        obscureText: controller.isConfirmPasswordHidden.value,
                        decoration: fieldDecoration("••••••••").copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(controller.isConfirmPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: controller.toggleConfirmPasswordVisibility,
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "By continuing, you agree to\nTerms of Use and Privacy Policy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: OutlinedButton(
                      onPressed: controller.signUp,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFE3F0FA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: GestureDetector(
                      onTap: controller.goToLogin,
                      child: const Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          children: [
                            TextSpan(
                              text: "Log In",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
