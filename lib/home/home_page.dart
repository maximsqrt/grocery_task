import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_task/home/cart_page.dart';
import 'package:grocery_task/home/controllers/cart_controller.dart';
import 'package:grocery_task/home/controllers/wishlist_controller.dart';
import 'package:grocery_task/home/overview_page.dart';
import 'package:grocery_task/home/wishlist_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    final wishlistController = context.watch<WishlistController>();

    return GestureDetector(
      onDoubleTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffF4F5F9),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: <Widget>[
            const OverviewPage(),
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
