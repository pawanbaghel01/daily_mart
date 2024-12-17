import 'dart:async';
import 'package:daily_mart/views/bottom_navigation_view.dart';
import 'package:daily_mart/views/onboarding_page/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() {
    Timer(const Duration(seconds: 3), () {
      print("checkLogin");
      dynamic user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print("User found, navigating to bottom navigation");
        Get.offAll(() => MyBottomNavigation());
      } else {
        print("No user found, navigating to onboarding");
        Get.offAll(() => OnboardingScreen());
      }
    });
  }
}
