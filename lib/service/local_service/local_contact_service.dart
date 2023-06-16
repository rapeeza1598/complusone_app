import 'package:complusone_app/model/contact.dart';
import 'package:hive/hive.dart';

class LocalBlogService {
  late Box<Contact> _popularContactBox;
  late Box<Contact> _contactBox;

  Future<void> init() async {
    _popularContactBox = await Hive.openBox<Contact>('PopularCategories');
    _contactBox = await Hive.openBox<Contact>('categories');
  }

  Future<void> assignAllPopularCategories(
      {required List<Contact> popularBlog}) async {
    await _popularContactBox.clear();
    await _popularContactBox.addAll(popularBlog);
  }

  Future<void> assignAllCategories({required List<Contact> blog}) async {
    await _contactBox.clear();
    await _contactBox.addAll(blog);
  }

  List<Contact> getPopularCategories() => _popularContactBox.values.toList();
  List<Contact> getCategories() => _contactBox.values.toList();
}
