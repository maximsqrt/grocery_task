import 'package:flutter/material.dart';
import 'package:grocery_task/features/overview/presentation/category_item.dart';
import 'package:grocery_task/features/overview/presentation/controllers/category_controller.dart';
import 'package:provider/provider.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoryController>().categories;

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }
}
