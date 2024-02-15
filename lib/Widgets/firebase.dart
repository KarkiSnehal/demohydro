import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final FirebaseFirestore _firestore;

  ProductService() : _firestore = FirebaseFirestore.instance;

  Future<Stream<List<Map<String, dynamic>>>> getAllProducts() async {
    try {
      await Firebase.initializeApp();
      return _firestore.collection('Products').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      print("Error initializing Firebase: $e");
      throw e;
    }
  }

  Future<Stream<List<Map<String, dynamic>>>> getProductsByCategory(
      String categoryName) async {
    try {
      await Firebase.initializeApp();
      return _firestore
          .collection('Products')
          .where('categoryname', isEqualTo: categoryName)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      print("Error initializing Firebase: $e");
      throw e;
    }
  }
}
