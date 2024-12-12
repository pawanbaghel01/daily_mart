import 'package:daily_mart/controllers/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the BottomNavController
    final BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      body: Obx(
        () => controller.screens[controller.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTabIndex,
          selectedItemColor: const Color(0xFF4CAF81),
          unselectedItemColor: Colors.grey,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Browse"),
          BottomNavigationBarItem(icon: Icon(Icons.storefront_sharp), label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.horizontal_split_outlined), label: "Order History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        ),
      ),
    );
  }
}
