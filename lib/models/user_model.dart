
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;
  String? password;
  Timestamp? createdAt;
  //String? lastOnlineStatus;
  String? phone;
  String? confirmPassword;
  String? fcmToken;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImage,
    this.password,
    this.phone,
    this.createdAt,
    //this.lastOnlineStatus,
    //this.status,
    this.confirmPassword,
    this.fcmToken, 
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    profileImage = json["profileImage"];
    password = json["password"];
    phone = json["phone"];
    createdAt = json["CreatedAt"];
    // lastOnlineStatus = json["LastOnlineStatus"];
    // status = json["Status"];
    confirmPassword = json["confirmPassword"];
    fcmToken = json["fcmToken"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["email"] = email;
    data["profileImage"] = profileImage;
    data["password"] = password;
    data["confirmPassword"] = confirmPassword;
    data["CreatedAt"] = createdAt;
    // data["LastOnlineStatus"] = lastOnlineStatus;
    data["phone"] = phone;
    // data["role"] = role;
    data["fcmToken"] = fcmToken;
    return data;
  }
}

