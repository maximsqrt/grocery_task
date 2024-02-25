import 'package:grocery_task/common/data/local_data_constants.dart';
import 'package:grocery_task/common/domain/product.dart';

class ProductRepository {
  Stream<List<Product>> get products {
    return Stream.value(mockProducts);
  }
}
