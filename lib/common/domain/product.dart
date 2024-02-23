import 'package:grocery_task/common/domain/category.dart';
import 'package:grocery_task/common/domain/product_badge.dart';

class Product {
  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.colorValue,
    this.category,
    this.badge,
  });

  final String name;
  final String description;
  final double price;
  final Category? category;

  final String imageAsset;

  final int colorValue;

  final ProductBadge? badge;
}
