import 'package:daily_mart/controllers/home_controller.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF81),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Product",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.03,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
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
                    buildBanner(screenWidth, screenHeight,
                        "assets/homeimage/home2.png", "READY TO DELIVER TO YOUR HOME"),
                    buildBanner(screenWidth, screenHeight,
                        "assets/homeimage/home2.png", "LIGHT UP YOUR HOLIDAYS"),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
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
              buildStoreSection(screenHeight, screenWidth),
            ],
          ),
        ),
      ),
      
    );
  }

  Widget buildBanner(
      double screenWidth, double screenHeight, String imagePath, String title) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.03),
      child: Stack(
        alignment: Alignment.center,
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
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
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
      ),
    );
  }

  Widget buildCategorySection(double screenHeight, double screenWidth) {
    final categories = [
      "Beverages",
      "Bread & Bakery",
      "Vegetables",
      "Fruit",
      "Egg",
      "Frozen veg",
      "Homecare",
      "Pet Care"
    ];
    return SizedBox(
      height: screenHeight * 0.15,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
               
                child: Image.asset("assets/homeimage/home2.png"),
              ),
              // CircleAvatar(
              //   radius: screenWidth * 0.08,
              //   backgroundColor: const Color(0xFF4CAF81),
              //   child: Text(
              //     categories[index][0],
              //     style: const TextStyle(color: Colors.white),
              //   ),
              // ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                categories[index],
                style: TextStyle(fontSize: screenHeight * 0.015),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildProductSection(
      double screenHeight, double screenWidth, String sectionTitle) {
    final products = [
      {"name": "Fish", "image": "assets/product1.jpg", "price": "\$15"},
      {"name": "Shampoo", "image": "assets/product2.jpg", "price": "\$25"},
    ];
    return Column(
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
          height: screenHeight * 0.2,
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
                        height: screenHeight * 0.15,
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
    );
  }

  Widget buildStoreSection(double screenHeight, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Store to follow",
              style: TextStyle(
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("View all"),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.03),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.1,
                      backgroundColor: Colors.greenAccent,
                      child: const Text(
                        "T",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF81),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Follow"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

