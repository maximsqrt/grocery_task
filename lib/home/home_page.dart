import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_task/home/controllers/cart_controller.dart';
import 'package:grocery_task/home/controllers/category_controller.dart';
import 'package:grocery_task/home/controllers/product_controller.dart';
import 'package:grocery_task/home/controllers/wishlist_controller.dart';
import 'package:grocery_task/home/overview_page.dart';
import 'package:grocery_task/home/repositories/category_repository.dart';
import 'package:grocery_task/home/repositories/product_repository.dart';

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

  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffF4F5F9),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: <Widget>[
            OverviewPage(
              productController: productController,
              cartController: cartController,
              wishlistController: wishlistController,
            ),
            const CartPage(),
            const WishlistPage(),
          ][currentScreenIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) => setState(() {
            currentScreenIndex = value;
          }),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: Text(cartController.items.length.toString()),
                child: const Icon(CupertinoIcons.cart),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                  label: Text(wishlistController.products.length.toString()),
                  child: const Icon(CupertinoIcons.heart)),
              label: 'Wishlist',
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
