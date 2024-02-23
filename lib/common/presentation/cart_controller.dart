import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/domain/product.dart';

class CartController extends ChangeNotifier {
  CartController();

  final List<Product> _items = [];

  List<Product> get items => _items;

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  int getQuantityForProduct(Product product) =>
      _items.where((element) => element == product).length;

  bool containsProduct(Product product) => _items.contains(product);
}
