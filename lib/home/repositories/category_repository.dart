import 'package:grocery_task/home/local_data_constants.dart';
import 'package:grocery_task/home/models/category.dart';

class CategoryRepository {
  List<Category> getCategories() {
    return categoriesMock;
  }
}
