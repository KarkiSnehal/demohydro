import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String parentId;

  CategoryModel({required this.id, required this.name, this.parentId = ''});

  //Empty helper function
  static CategoryModel empty() => CategoryModel(id: '', name: '');

  //convert model to Json structure so that you can store data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'ParentId': parentId,
    };
  }

  //Map json oriented document snapshot form Firebase to UserModel
  ///.allows to create different names for the same class constructor
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      //Map JSON Record to the model

      return CategoryModel(id: document.id, name: data['Name'] ?? '');
    } else {
      return CategoryModel.empty();
    }
  }
}
