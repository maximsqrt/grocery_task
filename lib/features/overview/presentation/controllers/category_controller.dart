import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/domain/category.dart';
import 'package:grocery_task/features/overview/data/category_repository.dart';

class CategoryController extends ChangeNotifier {
  CategoryController({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository {
    // Fetch and add initial categories.
    final categories = _categoryRepository.getCategories();
    _categories.addAll(categories);
    notifyListeners();
  }

  final CategoryRepository _categoryRepository;
  final List<Category> _categories = [];

  List<Category> get categories => _categories;
}
