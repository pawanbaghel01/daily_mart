import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_mart/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;
  RxBool isLoading = false.obs;
  Rx<UserModel> currentUser = UserModel().obs;

  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then(
          (value) => {
            currentUser.value = UserModel.fromJson(
              value.data()!,
            ),
          },
        );
  }

  Future<void> updateProfile(
    String imageUrl,
    String name,
    String lastName,
    String number,
  ) async {
    isLoading.value = true;
    try {
      final imageLink = await uploadFileToFirebase(imageUrl);
      final updatedUser = UserModel(
        id: auth.currentUser!.uid,
        email: auth.currentUser!.email,
        firstName: name,
        lastName: lastName,
        profileImage:
            imageUrl == "" ? currentUser.value.profileImage : imageLink,
        //phoneNumber: number,
      );
      await db.collection("users").doc(auth.currentUser!.uid).set(
            updatedUser.toJson(),
          );
      await getUserDetails();
    } catch (ex) {
      print(ex);
    }
    isLoading.value = false;
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/$imagePath";
    final file = File(imagePath);
    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        print(downloadImageUrl);
        return downloadImageUrl;
      } catch (ex) {
        print(ex);
        return "";
      }
    }
    return "";
  }

  //  Future<String> currentUserName() async {
  //   try {
  //     // Fetch the current user's document from Firestore
  //     DocumentSnapshot userDoc =
  //         await db.collection("users").doc(auth.currentUser!.uid).get();

  //     // Ensure the document exists and the data is not null
  //     if (userDoc.exists && userDoc.data() != null) {
  //       // Cast the document data to a Map
  //       Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

  //       // Check if the 'name' field exists and return it, else provide a default
  //       print('line no 186');
  //       print(userData?["name"]);
  //       return userData?["name"] ?? "Unknown User";
  //     } else {
  //       print('line no 190');
  //       return "User not found";
  //     }
  //   } catch (e) {
  //     // Handle any errors that occur during Firestore fetching
  //     print("Error fetching user name: $e");
  //     return "Error fetching user name";
  //   }
  // }

}
