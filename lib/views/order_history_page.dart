import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFABC2C0),
      appBar: AppBar(
        title: const Text('Order History'),
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigate to favorites
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 20),
                Text(
                  "Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "January 2024",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 4, // Adjust the item count as needed
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/orangeImage.png", // Corrected the path
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    
                    title: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: const Text("Coca Cola"),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: const Text("MRP-25"),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text("Delivered"),
                    ),
                  ),
                );
              },
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
