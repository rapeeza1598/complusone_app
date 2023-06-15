import 'package:app_ecommerce/model/blog.dart';
import 'package:hive/hive.dart';

class LocalBlogService {
  late Box<Blog> _popularBlogBox;
  late Box<Blog> _blogBox;

  Future<void> init() async {
    _popularBlogBox = await Hive.openBox<Blog>('PopularCategories');
    _blogBox = await Hive.openBox<Blog>('categories');
  }

  Future<void> assignAllPopularCategories({required List<Blog> popularBlog}) async {
    await _popularBlogBox.clear();
    await _popularBlogBox.addAll(popularBlog);
  }

  Future<void> assignAllCategories({required List<Blog> blog}) async {
    await _blogBox.clear();
    await _blogBox.addAll(blog);
  }

  List<Blog> getPopularCategories() => _popularBlogBox.values.toList();
  List<Blog> getCategories() => _blogBox.values.toList();
}