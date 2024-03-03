class CartItem {
  String cartItemId;
  String productId;
  int quantity;
  double totalCost;

  CartItem({
    required this.cartItemId,
    required this.productId,
    required this.quantity,
    required this.totalCost,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
      'totalCost': totalCost,
    };
  }
}
