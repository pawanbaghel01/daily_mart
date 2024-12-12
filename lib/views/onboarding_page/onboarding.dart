import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_mart/controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {

  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingScreen({super.key});
 

  @override
  Widget build(BuildContext context) {
    // MediaQuery for dynamic scaling
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
 
    return Scaffold(
      backgroundColor: const Color(0xFF4CAF81),
      body: SafeArea(
        child: Stack(
          children: [
            // Background Layers
            Positioned.fill(
              child: Container(color: Colors.white),
            ),
            Positioned(
              top: 0,
              child: Container(
                color: Colors.green,
                height: screenHeight * 0.45,
                width: screenWidth,
              ),
            ),
            Positioned(
              top: screenHeight * 0.25,
              left: screenWidth * 0.275,
              child: Container(
                color: Colors.white,
                height: screenHeight * 0.2,
                width: screenWidth * 0.45,
              ),
            ),

            // Main Content Section
            Column(
              children: [
                SizedBox(height: screenHeight * 0.3), // Spacer at the top

                // Image Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child:  Obx(() => Image.asset(
                      controller.imagePath.value,
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.6,
                      fit: BoxFit.contain,
                    )),
                  ),
                SizedBox(height: screenHeight * 0.08),

                // Text Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Column(
                    children: [
                      Obx( ()=>
                       Text(
                          controller.text1.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color: Colors.green[200],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Obx( ()=>
                         Text(
                          controller.text2.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color: Colors.green[200],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),

                // Indicator Dots
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        width: screenWidth * 0.03,
                        height: screenWidth * 0.03,
                        decoration: BoxDecoration(
                          color: controller.currentIndex.value == index
                              ?  const Color(0xFF33907C)
                              : const Color(0x33907C01),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),

                // Next Button
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenHeight * 0.03,
                  ),
                  child: ElevatedButton(
                    onPressed: controller.nextPage,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                      backgroundColor: const Color(0xFF4CAF81),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                    ),
                    child:  Obx( ()=>
                       Text(
                        controller.btnName.value,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
