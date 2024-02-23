import 'package:grocery_task/home/models/product.dart';

class CartItem {
  CartItem({
    required this.product,
    required this.quantity,
  });

  final Product product;
  int quantity;
}
