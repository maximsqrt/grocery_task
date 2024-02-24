import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/presentation/cart_controller.dart';
import 'package:grocery_task/features/cart/presentation/cart_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: cartController.items.length,
        itemBuilder: (context, index) =>
            CartItem(product: cartController.items[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 12.0),
      ),
    );
  }
}
