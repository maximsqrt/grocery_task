import 'package:grocery_task/home/models/cart_item.dart';

class CartController {
  CartController({required initialItems}) : _items = initialItems;

  final List<CartItem> _items;

  List<CartItem> get items => _items;
}
