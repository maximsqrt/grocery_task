import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_task/common/data/cart_repository.dart';
import 'package:grocery_task/common/data/wishlist_repository.dart';
import 'package:grocery_task/common/presentation/cart_controller.dart';
import 'package:grocery_task/common/presentation/wishlist_controller.dart';
import 'package:grocery_task/features/overview/data/category_repository.dart';
import 'package:grocery_task/features/overview/data/product_repository.dart';
import 'package:grocery_task/features/overview/presentation/controllers/category_controller.dart';
import 'package:grocery_task/features/overview/presentation/controllers/product_controller.dart';
import 'package:grocery_task/firebase_options.dart';
import 'package:grocery_task/grocery_app.dart';
import 'package:provider/provider.dart';




/// Wichtig war MultiProvider innerhalb der Build Methode von MyApp aufzurufen, damit sichergestellt ist, 
/// dass es nach der Initialisierung von Firebase aufgerufen wird.




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Es ist ein Fehler aufgetreten');
        }

        
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
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
                create: (context) => CartController(cartRepository: CartRepository()),
              ),
              ChangeNotifierProvider<WishlistController>(
                create: (context) =>
                    WishlistController(wishlistRepository: WishlistRepository()),
              ),
            ],
            child: const GroceryApp(),
          );
        }

        
        return CircularProgressIndicator();
      },
    );
  }
}
