import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mart/helper_screen/ui_helper.dart';
import 'package:daily_mart/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserUpdateProfile extends StatelessWidget {
  final UserModel userModel;
  const UserUpdateProfile({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    RxBool isEnable = false.obs;
    TextEditingController name = TextEditingController(text: userModel.firstName);
    TextEditingController lastName = TextEditingController(text: userModel.lastName);
    TextEditingController emailOrMobile = TextEditingController(text: userModel.email);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                        child: Container(
                          width: 150,
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: userModel.profileImage ?? 'assets/splash.png',
                                 // AssetsImage.defaultProfileUrl,//add default image path
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Personal Info",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: name,
                        enabled: isEnable.value,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: "User Name",
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Last Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                       TextField(
                        controller: lastName,
                        enabled: isEnable.value,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: "Last Name",
                          prefixIcon: Icon(
                            Icons.alternate_email_rounded,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Phone Number/ Email",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                       TextField(
                        controller:emailOrMobile,
                        enabled: isEnable.value,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: "Email/Phone",
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         UiHelper().primaryButton(
                            btnName: "Save",
                            icon: Icons.save,
                            ontap: () {},
                          ),
                        ],
                      )
                    ],
                  ))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
