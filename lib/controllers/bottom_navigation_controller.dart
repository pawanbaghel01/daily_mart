import 'package:daily_mart/views/browse_page.dart';
import 'package:daily_mart/views/home_dashboard.dart';
import 'package:daily_mart/views/order_history_page.dart';
import 'package:daily_mart/views/product_details.dart';
import 'package:daily_mart/views/profile_page.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {

  var currentIndex = 0.obs;

  final screens = [
    HomeDashboard(),
    BrowsePage(),
    ProductDetailPage(),
    OrderHistoryPage(),
    ProfilePage(),
  ];

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
