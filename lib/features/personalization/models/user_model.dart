//model class representing user data

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  late final String username;
  final String email;
  String profilePicture;

//constructor for UserModel
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePicture,
  });

  ///static function to create an empty user model
  static UserModel empty() =>
      UserModel(id: '', username: '', email: '', profilePicture: '');

  ///convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Username': username,
      'Email': email,
      'ProfilePicture': profilePicture,
    };
  }

  //factory method to create a UserModel from a Firebase doc snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
