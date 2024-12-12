import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add New Address Section
            Container(
              color: Colors.teal[50],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add New Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.teal),
                    onPressed: () {
                      // Add Address Logic
                    },
                  )
                ],
              ),
            ),
            const Divider(thickness: 1, height: 0),

            // Cart Items Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Cart Item 1
                  _buildCartItem(
                    imagePath: "assets/orangeImage.png",
                    title: "Coca Cola",
                    price: "\$25",
                    onRemove: () {
                      // Remove item logic
                    },
                  ),
                  const Divider(thickness: 1, height: 20),
                  TextButton(onPressed: (){}, child: Text("Remove",style:TextStyle(color: Colors.black,fontWeight: FontWeight.w200),))
                  // Add more items here if needed
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
                  const Text(
                    "Price Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPriceRow("Price (1 item)", "\$25"),
                  const SizedBox(height: 8),
                  _buildPriceRow("Delivery Fee", "Free", info: "info"),
                  const Divider(thickness: 1, height: 20),
                  _buildPriceRow(
                    "Total Amount",
                    "\$25",
                    isTotal: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ElevatedButton(
          onPressed: () {
            // Checkout logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Proceed to Checkout",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem({
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
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Decrease quantity
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                        color: Colors.teal,
                      ),
                      const Text("1"),
                      IconButton(
                        onPressed: () {
                          // Increase quantity
                        },
                        icon: const Icon(Icons.add_circle_outline),
                        color: Colors.teal,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        // IconButton(
        //   icon: const Icon(Icons.delete, color: Colors.red),
        //   onPressed: onRemove,
        // ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false, String? info}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: isTotal ? 16 : 14,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.w400,
              ),
            ),
            if (info != null)
              const SizedBox(width: 5),
              const Icon(
                Icons.info_outline,
                size: 16,
                color: Colors.grey,
              ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w400,
            color: isTotal ? Colors.teal : Colors.black,
          ),
        ),
      ],
    );
  }
}
