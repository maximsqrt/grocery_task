import 'package:grocery_task/common/data/local_data_constants.dart';
import 'package:grocery_task/common/domain/category.dart';

class CategoryRepository {
  Stream<List<Category>> get categories {
    return Stream.value(mockCategories);
  }
}
