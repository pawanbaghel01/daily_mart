import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Browse',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Navigate to favorites
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                       // border: InputBorder.none,
                       fillColor: Theme.of(context).colorScheme.surface,
                       filled: true,
                        hoverColor: Theme.of(context).colorScheme.surface,
                        hintText: 'Search Product',
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Filter Buttons
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _filterButton('Sort by',Icons.filter_list, Colors.white),
                  _filterButton('Location', Icons.location_on , Colors.white),
                  _filterButton('Category', Icons.list, Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: 6, // Adjust based on data
              itemBuilder: (context, index) {
                return _productCard(
                  context: context,
                  image: 'assets/orangeImage.png', // Replace with actual image path
                  name: index % 2 == 0 ? 'Apple' : 'Orange',
                  price: 25,
                  callback: () {
                    print("Buttun clicked");
                  },
                  oldPrice: index % 2 == 0 ? 35 : null,
                  brand: 'Tradly',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterButton(String label,IconData icondata ,Color primaryColor) {
    return OutlinedButton.icon(
      onPressed: () {
        // Add filter action
      },
      icon: Icon(
        icondata,
        color: primaryColor,
        size: 16,
      ),
      label: Text(
        label,
        style: TextStyle(color: primaryColor),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  Widget _productCard({
    required BuildContext context,
    required String image,
    required String name,
    required int price,
    required   Callback callback,
    String? brand,
    int? oldPrice,
  }) {
    return InkWell(
      onTap: callback,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    brand ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (oldPrice != null)
                        Text(
                          '\$$oldPrice',
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          //color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

