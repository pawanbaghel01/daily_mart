import 'package:daily_mart/controllers/auth_controller.dart';
import 'package:daily_mart/controllers/profile_update_controller.dart';
import 'package:daily_mart/controllers/theme_controller.dart';
import 'package:daily_mart/views/update_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ProfilePage extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  final ProfileController profileController = Get.put(ProfileController());
  final ThemeController themeController = Get.put(ThemeController());

  ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    bool themeValue = true;
    final username = '${profileController.currentUser.value.firstName} ${profileController.currentUser.value.lastName}';
    final userEmail = '${profileController.currentUser.value.email}';
    return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Profile'),
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
            color: Theme.of(context).colorScheme.primary,
          ),
           Positioned(
            top: 2,
            left: 20,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text(
                    username[0],
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(username,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Text(userEmail != ''? userEmail :profileController.currentUser.value.phone!,            
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Text(
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
              width: MediaQuery.of(context).size.width *
                  0.9, // Reduce the width to 90% of the screen
              height: MediaQuery.of(context).size.height *
                  0.45, // Reduce the height to 50% of the screen
              margin: const EdgeInsets.symmetric(horizontal: 1),
              padding: const EdgeInsets.all(2),
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
              child: Column(
                //shrinkWrap: true,
                children: [
                  customButton("Edit Profile", () {
                    Get.to(UserUpdateProfile(userModel: profileController.currentUser.value));
                  }),
                  customButton("Language & Currency", () {
                    themeController.themeChanger(themeValue);
                    themeValue = !themeValue;
                  }),
                  customButton("Feedback", () {}),
                  customButton("Refer a Friend", () {}),
                  customButton("Terms & Conditions", () {}),
                  customButton("Logout", () {
                   controller.logoutUser();
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customButton(String btnName, Callback callback) {
    return Column(
      children: [
        ListTile(
          title: Text(btnName,style: const TextStyle(fontSize: 17,color: Colors.black),),
          onTap: callback,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Adjust padding as needed
          dense: true, // Makes the ListTile more compact
        ),
        const Divider(
          color: Color(0xFFC2BDBD),
          thickness: 1.5,
          height: 3, // Reduce spacing between the Divider and the ListTile
        ),
      ],
    );
  }
}
