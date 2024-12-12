import 'package:daily_mart/helper_screen/ui_helper.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemCount: 6,
        itemBuilder: (context, index) {
          
          return UiHelper.buildProductCard(image: 'assets/orangeImage.png', title: "Tradly", price: "25");
        },
      ),
    );
  }
}
