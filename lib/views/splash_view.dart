import 'package:daily_mart/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    body: Center(
      child: Image.asset("assets/splash.png"),
    ),
       
    );
  }
}
