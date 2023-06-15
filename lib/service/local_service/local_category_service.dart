import 'package:hive/hive.dart';

import '../../model/category.dart';

class LocalCategoryService {
  late Box<Categorys> _popularCategoryBox;
  late Box<Categorys> _categoryBox;

  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<Categorys>('PopularCategories');
    _categoryBox = await Hive.openBox<Categorys>('categories');
  }

  Future<void> assignAllPopularCategories({required List<Categorys> popularCategories}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }

  Future<void> assignAllCategories({required List<Categorys> categories}) async {
    await _categoryBox.clear();
    await _categoryBox.addAll(categories);
  }

  List<Categorys> getPopularCategories() => _popularCategoryBox.values.toList();
  List<Categorys> getCategories() => _categoryBox.values.toList();
}