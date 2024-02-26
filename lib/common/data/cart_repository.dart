import 'dart:async';

import 'package:grocery_task/common/domain/product.dart';
import 'package:grocery_task/features/cart/domain/cart_product.dart';



class CartRepository {
  // Soll von Firestore kommen.
  final _tmpCartProductsList = <CartProduct>[];
  // Temporärer StreamController, um die Produkte zu speichern, bis die Daten
  // aus Firestore kommen.
  final StreamController<List<CartProduct>> _cartProductsController =
      StreamController<List<CartProduct>>();

  Stream<List<CartProduct>> get cartProducts {
    return _cartProductsController.stream;
  }

  Future<void> addProduct(Product product) async {
    if (_containsProduct(product)) {
      _tmpCartProductsList.firstWhere((cp) => cp.product == product).quantity++;
    } else {
      _tmpCartProductsList.add(CartProduct(product: product, quantity: 1));
    }
    // Neues Event zum StreamController hinzufügen, damit dieses ausgegeben wird.
    _cartProductsController.add(_tmpCartProductsList);
  }

  Future<void> removeProduct(Product product) async {
    if (_containsProduct(product)) {
      _tmpCartProductsList.firstWhere((cp) => cp.product == product).quantity--;
      if (_tmpCartProductsList
              .firstWhere((cp) => cp.product == product)
              .quantity ==
          0) {
        _tmpCartProductsList.removeWhere((cp) => cp.product == product);
      }
    }
    // Neues Event zum StreamController hinzufügen, damit dieses ausgegeben wird.
    _cartProductsController.add(_tmpCartProductsList);
  }

  bool _containsProduct(Product product) =>
      _tmpCartProductsList.any((cp) => cp.product == product);
}

