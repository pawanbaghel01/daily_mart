import 'dart:async';
import 'package:daily_mart/controllers/onbording_status_controller.dart';
import 'package:daily_mart/views/bottom_navigation_view.dart';
import 'package:daily_mart/views/loginpage_view.dart';
import 'package:daily_mart/views/onboarding_page/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
 OnbordingStatusController onbordingStatusController = Get.put(OnbordingStatusController());

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() {
    Timer(const Duration(seconds: 3), () async {
      print("checkLogin");
      dynamic user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print("User found, navigating to bottom navigation");
        Get.offAll(() => const MyBottomNavigation());
      } else {
        print("No user found, navigating to onboarding");
        bool onboardStatus = await onbordingStatusController.shouldShowOnboarding();
        onboardStatus ? Get.offAll(()=>LoginPageView()):
        Get.offAll(() => OnboardingScreen());
      }
    });
  }
}
