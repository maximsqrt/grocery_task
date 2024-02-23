import 'package:flutter/cupertino.dart';
import 'package:grocery_task/home/models/product.dart';
import 'package:grocery_task/home/repositories/product_repository.dart';

class ProductController extends ChangeNotifier {
  ProductController({required productRepository})
      : _productsRepository = productRepository {
    // Fetch products initially
    _products.addAll(_productsRepository.getProducts());
  }

  final ProductRepository _productsRepository;
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
  }

  void removeProduct(Product product) => _products.remove(product);

  int getQuantityForProduct(Product product) =>
      _products.where((element) => element == product).length;

  bool containsProduct(Product product) => _products.contains(product);
}
