import 'package:flutter/material.dart';
import 'package:grocery_task/home/controllers/cart_controller.dart';
import 'package:grocery_task/home/controllers/product_controller.dart';
import 'package:grocery_task/home/controllers/wishlist_controller.dart';
import 'package:grocery_task/home/widgets/action_headline.dart';
import 'package:grocery_task/home/widgets/categories_section.dart';
import 'package:grocery_task/home/widgets/hero_image.dart';
import 'package:grocery_task/home/widgets/product_item.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    super.key,
    required this.productController,
    required this.cartController,
    required this.wishlistController,
  });

  final ProductController productController;
  final CartController cartController;
  final WishlistController wishlistController;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                onAddToCart: () {
                  cartController.addProduct(product);
                },
                onRemoveItem: () => cartController.removeProduct(product),
                toggleFavorite: () => wishlistController.toggleProduct(product),
                isFavorite: wishlistController.containsProduct(product),
              ),
          ],
        ),
        const SizedBox(height: 22),
      ],
    );
  }
}
