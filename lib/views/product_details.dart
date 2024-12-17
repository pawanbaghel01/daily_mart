import 'package:daily_mart/views/addtocart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var isFollowing = false.obs;

  void toggleFollow() {
    isFollowing.value = !isFollowing.value;
  }
}

class ProductDetailPage extends StatelessWidget {
  final ProductDetailController controller = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Product Image and Header
            Stack(
              children: [
                Image.asset(
                  'assets/details1.png', // Replace with your asset path
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Product Title and Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Coca Cola",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    children: [
                      Text(
                        "\$25",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "\$50",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "50% off",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green,
                            child: Text(
                              "T",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Tradly Store",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Obx(() {
                        return ElevatedButton(
                          onPressed: controller.toggleFollow,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: controller.isFollowing.value
                                ? Colors.black
                                : Colors.white, backgroundColor: controller.isFollowing.value
                                ? Colors.grey[300]
                                : Colors.green,
                          ),
                          child: Text(
                            controller.isFollowing.value ? "Following" : "Follow",
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            // Product Description
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "Lobortis cras placerat diam ipsum ut. Nisi vel adipiscing "
                      "massa bibendum diam. Suspendisse mattis dui maecenas duis mattis. "
                      "Mattis aliquam at arcu, semper nunc.",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const AddToCartPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        minimumSize: const Size(double.infinity, 0),
                      ),
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(thickness: 1, color: Colors.grey),
                    const SizedBox(height: 8),
                    const Text(
                      "Condition: Organic",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Price Type: Fixed",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Category: Beverages",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Location: Kualalumpur, Malaysia",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Additional Details",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Delivery Details: Home Delivery Available, Cash On Delivery",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

