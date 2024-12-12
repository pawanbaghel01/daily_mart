import 'package:daily_mart/views/home_dashboard.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {

  var currentIndex = 0.obs;

  final screens = [
    HomeDashboard(),
  ];

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
