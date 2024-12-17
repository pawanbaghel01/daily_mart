// import 'package:get/get.dart';

// import 'package:daily_mart/models/user_model.dart';
// import 'package:daily_mart/views/bottom_navigation_view.dart';

// class AuthController extends GetxController {
//   var isLoading = false.obs;

//   // Dummy login function
//   void login(String emailOrMobile, String password) {
//     if (emailOrMobile.isEmpty || password.isEmpty) {
//       Get.snackbar("Error", "Please fill in all fields",
//           snackPosition: SnackPosition.BOTTOM);
//       return;
      
//     }

//     isLoading.value = true;

//     // Simulate a network request
//     Future.delayed(const Duration(seconds: 2), () {
//       isLoading.value = false;
//       Get.snackbar("Success", "Logged in successfully",
//           snackPosition: SnackPosition.BOTTOM);
//           Get.offAll(const MyBottomNavigation());
//     });
//   }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_mart/models/user_model.dart';
import 'package:daily_mart/views/bottom_navigation_view.dart';
import 'package:daily_mart/views/loginpage_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  // NotificationServices notificationServices = NotificationServices();
  // StatusController status = StatusController();

  // For Login
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar(
        "Login Successful",
        "Welcome back!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
      //status.checkAndUpdateDeviceToken();
      Get.offAll(const MyBottomNavigation());
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided.";
      } else if (e.code == 'invalid-email') {
        message = "The email address is not valid.";
      } else if (e.code == 'user-disabled') {
        message = "This user has been disabled.";
      } else if (e.code == 'too-many-requests') {
        message = "Too many requests. Try again later.";
      } else {
        message = "auth credential or password is incorrect.";
      }

      Get.snackbar(
        "Login Failed",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        "An unexpected error occurred. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    }
    isLoading.value = false;
  }

  // For Signup
  Future<void> createUser(String email, String fName, String lName,
  String password, String cPassword,
  ) async {
    isLoading.value = true;
    if (email.isEmpty || password.isEmpty || fName.isEmpty|| lName.isEmpty|| cPassword.isEmpty) {
      Get.snackbar(
        "An Error",
        "Please fill all the fields!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.actionTextColor,
      );
    } else {
      try {
        await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await initUser(email, fName,lName,password,cPassword);
        Get.snackbar(
          "Account Created",
          "Welcome $fName!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor,
        );
       // status.checkAndUpdateDeviceToken();
        Get.offAll(const MyBottomNavigation());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            "Signup Failed",
            "The password is too weak.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Get.theme.snackBarTheme.backgroundColor,
            colorText: Get.theme.snackBarTheme.actionTextColor,
          );
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            "Signup Failed",
            "An account already exists with that email.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Get.theme.snackBarTheme.backgroundColor,
            colorText: Get.theme.snackBarTheme.actionTextColor,
          );
        }
      } catch (e) {
        Get.snackbar(
          "Signup Failed",
          "An unexpected error occurred. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor,
        );
      }
    }
    isLoading.value = false;
  }

  Future<void> logoutUser() async {
    await auth.signOut();
    Get.offAll(LoginPageView());
  }

  Future<void> initUser(String emailOrMobile, String fname,String lName,String password,String cpassword ) async {
    var newUser = UserModel(
      emailOrMobile: emailOrMobile,
      fistName: fname.toLowerCase().trim(),
      lastName: fname.toLowerCase().trim(),
      id: auth.currentUser!.uid,
      password: password.toString().trim(),
      confirmPassword: cpassword.toString().trim(), 
      //fcmToken: await notificationServices.getDeviceToken(),
    );

    try {
      await db.collection("users").doc(auth.currentUser!.uid).set(
            newUser.toMap(),
          );
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

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
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
}
