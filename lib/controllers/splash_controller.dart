import 'dart:async';
import 'package:daily_mart/views/onboarding_page/onboarding.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

@override
  void onInit() {
    super.onInit();
    checkLogin();
  }

 void checkLogin(){
  Timer(const Duration(seconds: 3), (){
    Get.to(OnboardingScreen());
  });
 }

}