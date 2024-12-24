
import 'package:daily_mart/Config/Themes.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;

  void themeChanger(bool value){
     isDark.value = !value;
    Get.changeTheme(
      isDark.value ? darkTheme : lightTheme,
    );    
  }
}