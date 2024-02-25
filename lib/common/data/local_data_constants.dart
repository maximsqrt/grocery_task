import 'package:grocery_task/common/domain/category.dart';
import 'package:grocery_task/common/domain/product.dart';
import 'package:grocery_task/common/domain/product_badge.dart';

const List<Category> categoriesMock = [
  Category(
    name: 'Vegetable',
    iconAsset: 'assets/icons/vegetables.png',
    colorValue: 0xff28B446,
  ),
  Category(
    name: 'Fruits',
    iconAsset: 'assets/icons/fruits.png',
    colorValue: 0xffF8644A,
  ),
  Category(
    name: 'Beverages',
    iconAsset: 'assets/icons/beverages.png',
    colorValue: 0xffF5BA3C,
  ),
  Category(
    name: 'Grocery',
    iconAsset: 'assets/icons/grocery.png',
    colorValue: 0xffAE80FF,
  ),
  Category(
    name: 'Edible Oil',
    iconAsset: 'assets/icons/edible_oil.png',
    colorValue: 0xff0CD4DC,
  ),
  Category(
    name: 'Household',
    iconAsset: 'assets/icons/vacuum.png',
    colorValue: 0xffFF7EB6,
  ),
];

final List<Product> productsMock = [
  const Product(
    name: 'Fresh Peach',
    description: 'dozen',
    price: 8.00,
    imageAsset: 'assets/images/peach.png',
    colorValue: 0xffFFCEC1,
  ),
  const Product(
    name: 'Avocado',
    description: '2.0 lbs',
    price: 7.00,
    imageAsset: 'assets/images/avocado.png',
    colorValue: 0xffFCFFD9,
    badge: ProductBadge(
      name: 'New',
      colorValue: 0xffE8AD41,
    ),
  ),
  const Product(
    name: 'Pineapple',
    description: '1.15 lbs',
    price: 9.90,
    imageAsset: 'assets/images/pineapple.png',
    colorValue: 0xffFFE6C2,
  ),
  const Product(
    name: 'Black grapes',
    description: '5 lbs',
    price: 7.05,
    imageAsset: 'assets/images/grapes.png',
    colorValue: 0xffFEE1ED,
    badge: ProductBadge(
      name: '-16%',
      colorValue: 0xffF56262,
    ),
  ),
  const Product(
    name: 'Pomegranate',
    description: '1.50 lbs',
    price: 2.09,
    imageAsset: 'assets/images/pomegranate.png',
    colorValue: 0xffFFE3E2,
    badge: ProductBadge(
      name: 'New',
      colorValue: 0xffE8AD41,
    ),
  ),
  const Product(
    name: 'Fresh Green Broccoli',
    description: '3 lbs',
    price: 1,
    imageAsset: 'assets/images/broccoli.png',
    colorValue: 0xffD2FFD0,
  ),
];
