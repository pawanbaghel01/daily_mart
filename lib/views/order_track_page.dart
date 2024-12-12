import 'package:flutter/material.dart';

class OrderTrackPage extends StatelessWidget {
  const OrderTrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cancel_rounded)),
        ],
      ),
      body: Column(
        children: [
          //add done image
          const Icon(Icons.done),
          const Text("Thanks for Order"),
          Container(
            child: const Column(
              children: [
                Text("Track Order"),
                Text("Order ID - 123455"),
                SizedBox(
                  width: 20,
                  child: Divider(
                    color: Colors.teal,
                    thickness: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
