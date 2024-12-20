import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Order History'),
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Text(
                  "Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold,)
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
                  color: Theme.of(context).colorScheme.primary,                   
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
                    
                    title: const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Coca Cola",),
                    ),
                    subtitle: const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("MRP-25"),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                       // backgroundColor: Colors.teal,
                      ),
                      child: const Text("Delivered",),
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
