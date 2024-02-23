import 'package:grocery_task/home/models/product.dart';

class CartController {
  CartController();

  final List<Product> _items = [];

  List<Product> get items => _items;

  void addProduct(Product product) {
    _items.add(product);
  }

  void removeProduct(Product product) => _items.remove(product);

  int getQuantityForProduct(Product product) =>
      _items.where((element) => element == product).length;

  bool containsProduct(Product product) => _items.contains(product);
}
