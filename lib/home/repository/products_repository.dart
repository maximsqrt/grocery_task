import 'package:grocery_task/home/local_data_constants.dart';
import 'package:grocery_task/home/models/product.dart';

class ProductsRepository {
  List<Product> getProducts() {
    return productsMock;
  }
}
