import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrogang/data/services/productservice.dart';

import 'package:hydrogang/models/productmodel.dart';

final productsControllerProvider =
    StateNotifierProvider<ProductController, bool>((ref) {
  final productService = ref.watch(productsServiceProvider);
  // final storageService = ref.watch(storageServiceProvider);
  return ProductController(productService: productService, ref: ref);
});

final getProductsProvider = StreamProvider((ref) {
  final productsController = ref.watch(productsControllerProvider.notifier);
  return productsController.getProducts();
});

final getProductsGPTProvider =
    StreamProvider.family((ref, String categoryname) {
  return ref
      .watch(productsControllerProvider.notifier)
      .fetchProductsByCategory(categoryname);
});

final getProductsByCategoryProvider =
    StreamProvider.family((ref, String categoryname) {
  return ref
      .watch(productsControllerProvider.notifier)
      .getProductsByCategoryName(categoryname);
});
final relatedProductsProvider =
    StreamProvider.family((ref, String categoryname) {
  return ref
      .watch(productsControllerProvider.notifier)
      .getRelatedProducts(categoryname);
});
final searchProductsProvider = StreamProvider.family((ref, String search) {
  return ref.watch(productsControllerProvider.notifier).searchProducts(search);
});

class ProductController extends StateNotifier<bool> {
  final ProductService _productService;
  final Ref _ref;
  // final StorageService _storageService;
  ProductController({
    required ProductService productService,
    required Ref ref,
  })  : _productService = productService,
        _ref = ref,
        super(false);

  Stream<List<Product>> fetchProductsByCategory(String categoryname) {
    return _productService.fetchProductsByCategory(categoryname);
  }

  Stream<List<Product>> getProducts() {
    return _productService.getProducts();
  }

  Stream<Product> getProductById(String productId) {
    return _productService.getProductById(productId);
  }

  Stream<List<Product>> getProductsByCategoryName(String categoryname) {
    return _productService.getProductsByCategoryName(categoryname);
  }

  Stream<List<Product>> getRelatedProducts(String categoryname) {
    return _productService.getRelatedProducts(categoryname);
  }

  Stream<List<Product>> searchProducts(String search) {
    return _productService.searchProducts(search);
  }
}
