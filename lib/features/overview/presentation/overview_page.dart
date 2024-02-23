import 'package:flutter/material.dart';
import 'package:grocery_task/features/overview/presentation/action_headline.dart';
import 'package:grocery_task/features/overview/presentation/categories_section.dart';
import 'package:grocery_task/features/overview/presentation/hero_image.dart';
import 'package:grocery_task/features/overview/presentation/product_controller.dart';
import 'package:grocery_task/features/overview/presentation/product_item.dart';
import 'package:grocery_task/features/overview/presentation/search_field.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController =
        context.watch<ProductController>();

    return ListView(
      children: [
        const SearchField(),
        const SizedBox(height: 20),
        const HeroImage(),
        const SizedBox(height: 20),
        const ActionHeadline(title: 'Categories'),
        const SizedBox(height: 12),
        const CategoriesSection(),
        const SizedBox(height: 20),
        const ActionHeadline(title: 'Featured products'),
        const SizedBox(height: 12),
        Wrap(
          runSpacing: 20,
          alignment: WrapAlignment.spaceBetween,
          children: [
            for (final product in productController.products)
              ProductItem(product: product),
          ],
        ),
        const SizedBox(height: 22),
      ],
    );
  }
}
