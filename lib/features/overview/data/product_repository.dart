import 'package:grocery_task/common/data/local_data_constants.dart';
import 'package:grocery_task/common/domain/product.dart';

class ProductRepository {
  List<Product> getProducts() {
    return productsMock;
  }
}
