import 'package:flutter/material.dart';
import 'package:grocery_task/grocery_app.dart';
import 'package:grocery_task/home/controllers/cart_controller.dart';
import 'package:grocery_task/home/controllers/category_controller.dart';
import 'package:grocery_task/home/controllers/product_controller.dart';
import 'package:grocery_task/home/controllers/wishlist_controller.dart';
import 'package:grocery_task/home/repositories/category_repository.dart';
import 'package:grocery_task/home/repositories/product_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProductController>(
      create: (context) => ProductController(
        productRepository: ProductRepository(),
      ),
    ),
    ChangeNotifierProvider<CategoryController>(
      create: (context) => CategoryController(
        categoryRepository: CategoryRepository(),
      ),
    ),
    ChangeNotifierProvider<CartController>(
      create: (context) => CartController(),
    ),
    ChangeNotifierProvider<WishlistController>(
      create: (context) => WishlistController(),
    ),
  ], child: const GroceryApp()));
}
