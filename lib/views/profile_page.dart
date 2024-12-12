import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ProfileController extends GetxController {
  void logout() {
    // Handle logout logic
    print("User logged out!");
  }
}

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Navigate to favorites
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 250,
            color: Colors.teal,
          ),
          const Positioned(
            top: 2, 
            left: 20,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text(
                    'T',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Tradly Team',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '+1 9998887776',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'info@tradly.co',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
  alignment: Alignment.center,
  child: Container(
    width: MediaQuery.of(context).size.width * 0.9, // Reduce the width to 90% of the screen
    height: MediaQuery.of(context).size.height * 0.5, // Reduce the height to 50% of the screen
    margin: const EdgeInsets.symmetric(horizontal: 5),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: ListView(
      shrinkWrap: true,
      children: [
        customButton("Edit Profile", () {}),
        customButton("Language & Currency", () {}),
        customButton("Feedback", () {}),
        customButton("Refer a Friend", () {}),
        customButton("Terms & Conditions", () {}),
        customButton("Logout", () {}),
      ],
    ),
  ),
)

        ],
      ),
    );
  }

  Widget customButton(String btnName,Callback callback){
    return Column(
      children: [
        ListTile(
          title: Text(btnName),
          onTap: callback,
        ),
        const Divider(
          color: Color(0xFFC2BDBD),
          thickness: 1.5,
        )
      ],
    );
  }
}
