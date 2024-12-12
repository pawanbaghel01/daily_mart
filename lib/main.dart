import 'package:daily_mart/views/home_dashboard.dart';
import 'package:daily_mart/views/loginpage_view.dart';
import 'package:daily_mart/views/onboarding_page/onboarding.dart';
import 'package:daily_mart/views/product_details.dart';
import 'package:daily_mart/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailPage(),
    );
  }
}

