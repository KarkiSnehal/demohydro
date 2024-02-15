import 'package:hydrogang/data/services/categoryservice.dart';
import 'package:hydrogang/models/categoriesmodel.dart';

import 'package:riverpod/riverpod.dart';

final categoriesControllerProvider =
    StateNotifierProvider<CategoriesController, bool>((ref) {
  final categoriesService = ref.watch(categorieServiceProvider);
  return CategoriesController(categoryService: categoriesService, ref: ref);
});

///to get the products
final getProductsProvider = StreamProvider((ref) {
  final categoriesController = ref.watch(categoriesControllerProvider.notifier);
  return categoriesController.getCategories();
});

class CategoriesController extends StateNotifier<bool> {
  final CategoryService _categorySevice;
  final Ref _ref;

  CategoriesController(
      {required CategoryService categoryService, required Ref ref})
      : _categorySevice = categoryService,
        _ref = ref,
        super(false);

  Stream<List<Category>> getCategories() {
    return _categorySevice.getCategories();
  }
}
