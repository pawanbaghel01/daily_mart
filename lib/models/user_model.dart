//import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel {
  String? id;
  String? fistName;
  String? lastName;
  String? emailOrMobile;
  String? password;
  String? confirmPassword;
 // Timestamp? createdOn;

  UserModel({
    required this.id,
    required this.fistName,
    required this.lastName,
    required this.emailOrMobile,
    required this.password,
    required this.confirmPassword,
    //required this.createdOn,
  });

  factory UserModel.fromDocumentSnapshot(//DocumentSnapshot 
    Map<String,dynamic> doc) {
    return UserModel(
      id: doc['id'],
      fistName: doc['fistName'],
      lastName:doc['lastName'],
      emailOrMobile: doc['emailOrMobile'],
      password: doc['password'],
      confirmPassword: doc['confirmPassword'],
     // createdOn: doc['createdon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fistName': fistName,
      'lastName': lastName,
      'emailOrMobile':emailOrMobile,
      'Password': password,
      'confirmPassword':confirmPassword,
      //'createdOn':createdOn,
    };
  }
}