import 'package:grocery_task/common/domain/product.dart';

class CartProduct {
  /// Used to store a product and its quantity in the cart.
  CartProduct({
    required this.product,
    required this.quantity,
  });

  final Product product;
  int quantity;
}
