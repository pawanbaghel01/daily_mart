import 'package:get/get.dart';

import '../views/loginpage_view.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  var imagePath = "assets/Onboarding_1.png".obs; // Initial image path
  var text1 = "Empowering Artisans,".obs;
  var text2 = "Farmers & Micro Business.".obs;
  var btnName = "Next".obs;

  void nextPage() {
    if (currentIndex.value == 0) {
      currentIndex.value++;
      text1.value ="Connecting NGOs, ";
      text2.value ="Social Enterprises with Communities";
      imagePath.value = "assets/Onboarding_2.png";
    } else if (currentIndex.value == 1) {
      currentIndex.value++;
      imagePath.value = "assets/Onboarding_3.png";
      btnName.value ="Finish";
      text1.value =" Donate, Invest & Support ";
      text2.value ="infrastructure projects";
    }  else {
      // Navigate to the login page or any other page
      Get.offAll(LoginPageView());
    }
  }
}
