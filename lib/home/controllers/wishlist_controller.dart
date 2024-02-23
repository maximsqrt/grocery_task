import 'package:grocery_task/home/models/product.dart';

class WishlistController {
  WishlistController();

  final List<Product> _items = [];

  List<Product> get products => _items;

  void addProduct(Product product) {
    _items.add(product);
  }

  void removeProduct(Product product) => _items.remove(product);

  int getQuantityForProduct(Product product) =>
      _items.where((element) => element == product).length;

  bool containsProduct(Product product) => _items.contains(product);

  void toggleProduct(Product product) {
    if (containsProduct(product)) {
      removeProduct(product);
    } else {
      addProduct(product);
    }
  }
}
