import 'package:daily_mart/helper_screen/ui_helper.dart';
import 'package:flutter/material.dart';

class StoreProfilePage extends StatelessWidget {
  const StoreProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7D5D5),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Tradly Store'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          // Store Info Section
          Container(
            color: Colors.teal,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Text(
                            'T',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tradly Store',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'tradly.app',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Follow'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In augue nunc vel rhoncus.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 12),
                const Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      label: Text('Groceries'),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.teal),
                    ),
                    Chip(
                      label: Text('Vegetables'),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.teal),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Follower and Product Counts
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Followers',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '0',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Total Products',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '0',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Product Categories
          // Product Categories
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryChip('All Product', true),
                _buildCategoryChip('Fruit', false),
                _buildCategoryChip('Vegetables', false),
                _buildCategoryChip('Home', false),
              ],
            ),
          ),

          // Product Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: 6, // Example count
                itemBuilder: (context, index) {
                    //return UiHelper.buildProductCard(image: 'assets/orangeImage.png', title: "Tradly", price: "25");
                  return _buildProductCard(
                    image: index % 2 == 0
                        ? 'assets/orangeImage.png'
                        : 'assets/mangoImage.png',
                    title: index % 2 == 0 ? 'Apple' : 'Orange',
                    price: index % 2 == 0 ? '\$25' : '\$25',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.teal,
        backgroundColor: Colors.grey[200],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
        onSelected: (bool selected) {},
      ),
    );
  }

  Widget _buildProductCard({
    required String image,
    required String title,
    required String price,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'Tradly',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      price,
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
