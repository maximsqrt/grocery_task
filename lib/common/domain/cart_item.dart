import 'package:grocery_task/common/domain/product.dart';

class CartItem {
  CartItem({
    required this.product,
    required this.quantity,
  });

  final Product product;
  int quantity;
}
