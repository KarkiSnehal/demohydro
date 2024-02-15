//get categories from firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydrogang/constants/firebaseconstants.dart';
import 'package:hydrogang/models/categoriesmodel.dart';

import 'package:hydrogang/providers/firebaseproviders.dart';
import 'package:riverpod/riverpod.dart';

final categorieServiceProvider = Provider(
    (ref) => CategoryService(firestore: ref.watch(firebaseFirestoreProvider)));

class CategoryService {
  final FirebaseFirestore _fireStore;
  CategoryService({required FirebaseFirestore firestore})
      : _fireStore = firestore;
  CollectionReference get _categories =>
      _fireStore.collection(FirebaseConstants.categories);
  Stream<List<Category>> getCategories() {
    return _categories.snapshots().map((event) {
      List<Category> categoriesList = [];
      for (var doc in event.docs) {
        categoriesList
            .add(Category.fromMap(doc.data() as Map<String, dynamic>));
      }
      return categoriesList;
    });
  }
}
