import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_mart/models/user_model.dart';
import 'package:daily_mart/views/bottom_navigation_view.dart';
import 'package:daily_mart/views/loginpage_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  bool isPhoneNumber(String input) {
    final RegExp phoneRegex = RegExp(r'^[0-9]{10,15}$'); // Valid phone numbers
    return phoneRegex.hasMatch(input);
  }

  void signUp(String emailOrPhone, String fName, String lName, String password,
      String cPassword) {
    if (isPhoneNumber(emailOrPhone)) {
      // Handle phone number signup
      signUpWithPhoneNumber(emailOrPhone, fName, lName, password, cPassword);
    } else {
      // Handle email signup
      signUpWithEmailAndPassword(
          emailOrPhone, fName, lName, password, cPassword);
    }
  }

  // For Login
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      Get.snackbar(
        "Login Successful",
        "Welcome back!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
      Get.offAll(const MyBottomNavigation());
    } on FirebaseAuthException catch (e) {
      String message = _getAuthErrorMessage(e);
      Get.snackbar(
        "Login Failed",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    } catch (_) {
      Get.snackbar(
        "Login Failed",
        "An unexpected error occurred. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // For Signup
  Future<void> signUpWithEmailAndPassword(String email, String fName,
      String lName, String password, String cPassword) async {
    if (email.isEmpty ||
        fName.isEmpty ||
        lName.isEmpty ||
        password.isEmpty ||
        cPassword.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
      return;
    }

    if (password != cPassword) {
      Get.snackbar(
        "Error",
        "Passwords do not match!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
      return;
    }

    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await _initUser(email, fName, lName, '', password, cPassword);
      Get.snackbar(
        "Account Created",
        "Welcome $fName!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
      Get.offAll(const MyBottomNavigation());
    } on FirebaseAuthException catch (e) {
      String message = _getAuthErrorMessage(e);
      Get.snackbar(
        "Signup Failed",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logoutUser() async {
    await auth.signOut();
    Get.offAll(LoginPageView());
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email.trim());
      Get.snackbar(
        "Password Reset",
        "Check your email to reset your password.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    } catch (ex) {
      Get.snackbar(
        "Error",
        ex.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }

  Future<void> signUpWithPhoneNumber(String phoneNumber, String fName,
      String lName, String password, String cPassword) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          await _initUser('', fName, lName, phoneNumber, password, cPassword);  
          print("Phone number verified and user signed in.");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification failed: ${e.message}");
          Get.snackbar(
            "Error",
            e.message ?? "Phone verification failed.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Get.theme.snackBarTheme.backgroundColor,
            colorText: Get.theme.snackBarTheme.actionTextColor,
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          _showOtpDialog(Get.overlayContext!, verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Timeout: $verificationId");
        },
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "An unexpected error occurred during phone verification.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }

  Future<void> _initUser(String email, String fName, String lName, String phone,
      String password, String cPassword) async {
    UserModel newUser = UserModel(
      email: email.trim(),
      firstName: fName.toLowerCase().trim(),
      lastName: lName.toLowerCase().trim(),
      id: auth.currentUser!.uid,
      phone: phone.trim(),
      password: password.trim(),
      confirmPassword: cPassword.trim(),
      createdAt: Timestamp.now(),
    );

    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(newUser.toJson());
    } catch (ex) {
      Get.snackbar(
        "Error",
        "Failed to initialize user data.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
  }

  void _showOtpDialog(BuildContext context, String verificationId) {
    String otp = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter OTP"),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) => otp = value,
          ),
          actions: [
            TextButton(
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: otp,
                );
                await FirebaseAuth.instance.signInWithCredential(credential);
                Navigator.of(context).pop();
                print("User signed in with phone number.");
              },
              child: const Text("Verify"),
            ),
          ],
        );
      },
    );
  }

  String _getAuthErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return "No user found for that email.";
      case 'wrong-password':
        return "Wrong password provided.";
      case 'invalid-email':
        return "The email address is not valid.";
      case 'user-disabled':
        return "This user has been disabled.";
      case 'too-many-requests':
        return "Too many requests. Try again later.";
      default:
        return "Authentication failed. Please try again.";
    }
  }
}
