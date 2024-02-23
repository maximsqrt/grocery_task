import 'package:flutter/cupertino.dart';
import 'package:grocery_task/home/models/product.dart';

class WishlistController extends ChangeNotifier {
  WishlistController();

  final List<Product> _items = [];

  List<Product> get products => _items;

  void _addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void _removeProduct(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  bool containsProduct(Product product) => _items.contains(product);

  void toggleProduct(Product product) {
    if (containsProduct(product)) {
      _removeProduct(product);
    } else {
      _addProduct(product);
    }
    notifyListeners();
  }
}
