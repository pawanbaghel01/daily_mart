import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_mart/controllers/add_current_location.dart';
import 'package:daily_mart/views/add_atmcard.dart';
import 'package:daily_mart/views/add_new_address_page.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddCurrentLocationController controller = Get.put(AddCurrentLocationController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add New Address Section
            Obx(() => controller.currentAddress.value.isEmpty
                ? Container(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
                          onPressed: () {
                            Get.to(const AddNewAddressPage());
                          },
                        ),
                        Text(
                          "Add New Address",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.currentAddress.value,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(const AddNewAddressPage());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                          ),
                          child: Text(
                            "Change",
                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  )),
            const Divider(thickness: 1, height: 0),

            // Cart Items Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildCartItem(
                    context: context,
                    imagePath: "assets/orangeImage.png",
                    title: "Coca Cola",
                    price: "\$25",
                    onRemove: () {
                      // Remove item logic
                    },
                  ),
                ],
              ),
            ),

            const Divider(thickness: 1, height: 0),

            // Price Details Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPriceRow("Price (1 item)", "\$25", context: context),
                  const SizedBox(height: 8),
                  _buildPriceRow("Delivery Fee", "Free", context: context),
                  const Divider(thickness: 1, height: 20),
                  _buildPriceRow("Total Amount", "\$25", isTotal: true, context: context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: ElevatedButton(
              onPressed: controller.currentAddress.value.isEmpty
                  ? null
                  : () {
                      Get.to(const AddATMCard());
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.currentAddress.value.isEmpty
                    ? Theme.of(context).disabledColor
                    : Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Proceed to Checkout",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildCartItem({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String price,
    required VoidCallback onRemove,
  }) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                price,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(
    String label,
    String value, {
    bool isTotal = false,
    required BuildContext context,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
