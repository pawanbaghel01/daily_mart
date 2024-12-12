import 'package:daily_mart/views/bottom_navigation_view.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  // Dummy login function
  void login(String emailOrMobile, String password) {
    if (emailOrMobile.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
      
    }

    isLoading.value = true;

    // Simulate a network request
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar("Success", "Logged in successfully",
          snackPosition: SnackPosition.BOTTOM);
          Get.offAll(const MyBottomNavigation());
    });
  }
}