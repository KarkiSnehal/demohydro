import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseConstants {
  static const categories = "Categories";
  static const products = "Products";
  static const productsCollection = "Products";
  static const cartCollection = "cart";
  static const orderCollection = "orders";
  static final currentUser = FirebaseAuth.instance.currentUser;
  static final cartRef =
      FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
  static final orderRef = FirebaseFirestore.instance.collection("Orders");
  static final addressRef =
      FirebaseFirestore.instance.collection("Adresses").doc(currentUser!.uid);
  static final favouriteRef =
      FirebaseFirestore.instance.collection("favourites").doc(currentUser!.uid);
}
