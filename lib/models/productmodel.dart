import 'dart:convert';

class Product {
  String productId;
  String name;
  String image;
  bool? isAvailable;
  double oldPrice;
  double price;
  String description;
  String? categoryname;
  Product({
    required this.productId,
    required this.name,
    required this.image,
    this.isAvailable,
    required this.oldPrice,
    required this.price,
    required this.description,
    required this.categoryname,
  });

  Product copyWith({
    String? productId,
    String? name,
    String? image,
    bool? isAvailable,
    double? oldPrice,
    double? price,
    String? description,
    String? categoryname,
  }) {
    return Product(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      isAvailable: isAvailable ?? this.isAvailable,
      oldPrice: oldPrice ?? this.oldPrice,
      price: price ?? this.price,
      description: description ?? this.description,
      categoryname: categoryname ?? this.categoryname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'name': name,
      'image': image,
      'isAvailable': isAvailable,
      'oldPrice': oldPrice,
      'price': price,
      'description': description,
      'categoryname': categoryname,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      isAvailable: map['isAvailable'] ?? '',
      oldPrice: map['oldPrice'] as double,
      price: map['price'] as double,
      description: map['description'] ?? '',
      categoryname: map['categoryname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(productId: $productId, name: $name, image: $image, isAvailable: $isAvailable, oldPrice: $oldPrice, price: $price, description: $description, categoryname: $categoryname)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.name == name &&
        other.image == image &&
        other.isAvailable == isAvailable &&
        other.oldPrice == oldPrice &&
        other.price == price &&
        other.description == description &&
        other.categoryname == categoryname;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        name.hashCode ^
        image.hashCode ^
        isAvailable.hashCode ^
        oldPrice.hashCode ^
        price.hashCode ^
        description.hashCode ^
        categoryname.hashCode;
  }
}
