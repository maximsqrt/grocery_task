import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/domain/product.dart';
import 'package:grocery_task/features/cart/domain/cart_product.dart';

class CartController extends ChangeNotifier {
  CartController();

  final List<CartProduct> _cartProducts = [];

  /// Returns the CartProducts (product + quantity) in the cart.
  List<CartProduct> get cartProducts => _cartProducts;

  /// Returns the distinct products in the cart.
  List<Product> get products => _cartProducts.map((e) => e.product).toList();

  /// Returns the total number of items in the cart (sum of the quantities of all products).
  int get totalItems => _cartProducts.fold(0, (prev, cp) => prev + cp.quantity);

  void addProduct(Product product) {
    if (containsProduct(product)) {
      _cartProducts.firstWhere((cp) => cp.product == product).quantity++;
    } else {
      _cartProducts.add(CartProduct(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    if (containsProduct(product)) {
      _cartProducts.firstWhere((cp) => cp.product == product).quantity--;
      if (_cartProducts.firstWhere((cp) => cp.product == product).quantity ==
          0) {
        _cartProducts.removeWhere((cp) => cp.product == product);
      }
    }
    notifyListeners();
  }

  int getQuantityForProduct(Product product) =>
      _cartProducts
          .where((cp) => cp.product == product)
          .singleOrNull
          ?.quantity ??
      0;

  bool containsProduct(Product product) =>
      _cartProducts.any((cp) => cp.product == product);
}
