import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_task/home/controllers/cart_controller.dart';
import 'package:grocery_task/home/controllers/category_controller.dart';
import 'package:grocery_task/home/controllers/product_controller.dart';
import 'package:grocery_task/home/controllers/wishlist_controller.dart';
import 'package:grocery_task/home/models/product.dart';
import 'package:grocery_task/home/repositories/category_repository.dart';
import 'package:grocery_task/home/repositories/product_repository.dart';
import 'package:grocery_task/home/widgets/action_headline.dart';
import 'package:grocery_task/home/widgets/categories_section.dart';
import 'package:grocery_task/home/widgets/hero_image.dart';
import 'package:grocery_task/home/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController =
      ProductController(productRepository: ProductRepository());

  final CategoryController categoryController =
      CategoryController(categoryRepository: CategoryRepository());

  final CartController cartController = CartController();

  final WishlistController wishlistController = WishlistController();

  void onAddItem(Product product) {
    setState(() {
      cartController.addProduct(product);
    });
  }

  void onRemoveItem(Product product) {
    setState(() {
      cartController.removeProduct(product);
    });
  }

  void toggleFavoriteList(Product product) {
    setState(() {
      if (wishlistController.containsProduct(product)) {
        wishlistController.removeProduct(product);
      } else {
        wishlistController.addProduct(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: const Color(0xffF4F5F9),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search keywords..',
                      prefixIcon: Icon(Icons.search),
                      fillColor: Color(0xffe4e5e9),
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const HeroImage(),
                const SizedBox(height: 20),
                CategoriesSection(),
                const SizedBox(height: 20),
                const ActionHeadline(title: 'Featured products'),
                const SizedBox(height: 12),
                Wrap(
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    for (final product in productController.products)
                      ProductItem(
                        product: product,
                        quantity: cartController.getQuantityForProduct(product),
                        onAddToCart: () => onAddItem(product),
                        onRemoveItem: () => onRemoveItem(product),
                        toggleFavorite: () => toggleFavoriteList(product),
                        isFavorite: wishlistController.containsProduct(product),
                      ),
                  ],
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart),
                label: 'Wishlist',
              ),
            ],
          )),
    );
  }
}
