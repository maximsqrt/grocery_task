import 'package:grocery_task/common/data/local_data_constants.dart';
import 'package:grocery_task/common/domain/category.dart';

class CategoryRepository {
  List<Category> getCategories() {
    return categoriesMock;
  }
}
