import 'package:daily_mart/controllers/onbording_status_controller.dart';
import 'package:daily_mart/views/signuppage_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_mart/controllers/auth_controller.dart';

// ignore: must_be_immutable
class LoginPageView extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  OnbordingStatusController onbordingStatusController = Get.put(OnbordingStatusController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    onbordingStatusController.saveOnboardingStatus();
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF4CAF81),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to Daily Mart",
                    style: TextStyle(
                      fontSize: screenHeight * 0.04, // Dynamic font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      fontSize: screenHeight * 0.03,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.07),
                  // Email/Mobile Number TextField
                  TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Email/Mobile Number",
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2), // White border when not focused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2), // White border when focused
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.05,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  // Password TextField
                  TextField(
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2), // White border when not focused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2), // White border when focused
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.05,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.05),
                  // Login Button
                  Obx(() {
                    return ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.login(emailController.text,
                              passwordController.text);
                            },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF4CAF81),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: const Color(0xFF0B3A92),
                              strokeWidth: screenWidth * 0.01,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    );
                  }),
                  SizedBox(height: screenHeight * 0.06),
                  // Forgot Password
                  TextButton(
                    onPressed: () {
                      Get.snackbar("Info", "Forgot Password clicked",
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: screenHeight * 0.025,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: screenHeight * 0.025,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Get.snackbar("Info", "Sign up clicked",
                          //     snackPosition: SnackPosition.BOTTOM);
                          Get.offAll(SignUpPageView());
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.025,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
