import 'package:daily_mart/controllers/home_controller.dart';
import 'package:daily_mart/views/beverages_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDashboard extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Groceries"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Obx(() => CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        "${controller.cartCount.value}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            // Search Bar
            Container(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Product',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Banner
            SizedBox(
              height: screenHeight * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildDynamicBanner(
                    imagePath:
                        "assets/homeimage/home2.png", // Dynamic image path
                    bannerText: "READY TO DELIVER TO YOUR HOME", // Dynamic text
                    buttonText: "START SHOPPING", // Dynamic button text
                    onButtonPressed: () {
                      print("Start Shopping button pressed");
                    },
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  buildBanner(screenWidth, screenHeight,
                      "assets/homeimage/home2.png", '')
                ],
              ),
            ),
            // Categories
            buildCategorySection(screenHeight, screenWidth),
            SizedBox(height: screenHeight * 0.03),
            // New Product Section
            buildProductSection(screenHeight, screenWidth, "New Product"),
            SizedBox(height: screenHeight * 0.03),
            // Popular Product Section
            buildProductSection(screenHeight, screenWidth, "Popular Product"),
            SizedBox(height: screenHeight * 0.03),
            // Store to Follow Section
            //buildStoreSection(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget buildDynamicBanner({
    required String imagePath, // Path to the background image
    required String bannerText, // Text to display
    required String buttonText, // Button label
    required VoidCallback onButtonPressed, // Button action
    required double screenWidth,
    required double screenHeight,
  }) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.25, // Adjust the height dynamically
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with Transparency
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Content
          Positioned(
            left: screenWidth * 0.08,
            top: screenHeight * 0.06,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dynamic Text
                Text(
                  bannerText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        screenHeight * 0.02, // Adjust font size dynamically
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                // Dynamic Button
                ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.white),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.01,
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBanner(
      double screenWidth, double screenHeight, String imagePath, String title) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            width: screenWidth * 0.9,
            height: screenHeight * 0.25,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: screenWidth * 0.8,
          height: screenHeight * 0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildCategorySection(double screenHeight, double screenWidth) {
    final categories = [
      "assets/categories/beverages.jpeg",
      "assets/categories/bread&bakery.jpeg",
      "assets/categories/vegetables.jpeg",
      "assets/categories/fruit.jpeg",
      "assets/categories/egg.jpeg",
      "assets/categories/frozen_veg.jpeg",
      "assets/categories/homecare.jpeg",
      "assets/categories/petcare.jpeg"
    ];
    return SizedBox(
      height: screenHeight * 0.3,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(const BeveragesPage());
            },
            child: Container(
              height: 200,
              width: 100,
              child: Image.asset(categories[index]),
            ),
          );
        },
      ),
    );
  }

  Widget buildProductSection(
      double screenHeight, double screenWidth, String sectionTitle) {
    final products = [
      {"name": "Fish", "image": "assets/categories/fish.png", "price": "\$15"},
      {
        "name": "Shampoo",
        "image": "assets/categories/shampoo.png",
        "price": "\$25"
      },
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See All"),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.03),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          products[index]["image"]!,
                          width: screenWidth * 0.35,
                          height: screenHeight * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(products[index]["name"]!),
                      Text(
                        products[index]["price"]!,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildStoreSection(double screenHeight, double screenWidth) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Store to follow",
  //             style: TextStyle(
  //               fontSize: screenHeight * 0.02,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () {},
  //             child: const Text("View all"),
  //           ),
  //         ],
  //       ),
  //       SizedBox(
  //         height: screenHeight * 0.15,
  //         child: ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 3,
  //           itemBuilder: (context, index) {
  //             return Padding(
  //               padding: EdgeInsets.only(right: screenWidth * 0.03),
  //               child: Column(
  //                 children: [
  //                   CircleAvatar(
  //                     radius: screenWidth * 0.1,
  //                     backgroundColor: Colors.greenAccent,
  //                     child: const Text(
  //                       "T",
  //                       style: TextStyle(color: Colors.white, fontSize: 24),
  //                     ),
  //                   ),
  //                   SizedBox(height: screenHeight * 0.01),
  //                   ElevatedButton(
  //                     onPressed: () {},
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFF4CAF81),
  //                       foregroundColor: Colors.white,
  //                     ),
  //                     child: const Text("Follow"),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
