import 'package:hive/hive.dart';
import '../../model/project.dart';

class LocalProjectService {
  late Box<Project> _projectBox;

  Future<void> init() async {
    _projectBox = await Hive.openBox<Project>('Project');
  }

  Future<void> assignAllPopularProducts(
      {required List<Project> projects}) async {
    await _projectBox.clear();
    await _projectBox.addAll(projects);
  }

  List<Project> getPopularProducts() => _projectBox.values.toList();
}
