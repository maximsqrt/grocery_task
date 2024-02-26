import 'package:flutter/cupertino.dart';
import 'package:grocery_task/common/domain/category.dart';
import 'package:grocery_task/features/overview/data/category_repository.dart';

class CategoryController extends ChangeNotifier {
  final CategoryRepository _categoryRepository = CategoryRepository();
  CategoryController()
       {
    _listenForCategories();
    
  }

 
  final List<Category> _categories = [];

  List<Category> get categories => _categories;

  void _listenForCategories() {
    _categoryRepository.categorie.listen((List<Category> event) {
      _categories.clear();
      _categories.addAll(event);
      notifyListeners();
    });
  }



}
