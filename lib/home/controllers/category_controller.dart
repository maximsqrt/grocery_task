import 'package:grocery_task/home/models/category.dart';
import 'package:grocery_task/home/repositories/category_repository.dart';

class CategoryController {
  CategoryController({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository {
    // Fetch and add initial categories.
    final categories = _categoryRepository.getCategories();
    _categories.addAll(categories);
  }

  final CategoryRepository _categoryRepository;
  final List<Category> _categories = [];

  List<Category> get categories => _categories;
}
