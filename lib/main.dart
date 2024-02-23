import 'package:flutter/material.dart';
import 'package:grocery_task/common/presentation/cart_controller.dart';
import 'package:grocery_task/common/presentation/wishlist_controller.dart';
import 'package:grocery_task/features/overview/data/category_repository.dart';
import 'package:grocery_task/features/overview/data/product_repository.dart';
import 'package:grocery_task/features/overview/presentation/category_controller.dart';
import 'package:grocery_task/features/overview/presentation/product_controller.dart';
import 'package:grocery_task/grocery_app.dart';
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
