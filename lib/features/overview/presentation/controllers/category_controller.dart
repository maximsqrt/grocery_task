import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/domain/category.dart';
import 'package:grocery_task/features/overview/data/category_repository.dart';

class CategoryController extends ChangeNotifier {
  CategoryController({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository {
    _listenForCategories();
  }

  final CategoryRepository _categoryRepository;
  final List<Category> _categories = [];

  List<Category> get categories => _categories;

  void _listenForCategories() {
    _categoryRepository.categories.listen((event) {
      _categories.clear();
      _categories.addAll(event);
      notifyListeners();
    });
  }
}
