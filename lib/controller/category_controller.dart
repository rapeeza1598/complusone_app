import 'package:get/get.dart';
import 'package:complusone_app/model/category.dart';
import 'package:complusone_app/service/local_service/local_category_service.dart';
import 'package:complusone_app/service/remote_service/remote_category_service.dart';

import '../service/local_service/local_auth_service.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<Categorys> categoryList = List<Categorys>.empty(growable: true).obs;
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    await _localCategoryService.init();
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      String? token = LocalAuthService().getToken();
      isCategoryLoading(true);
      if (_localCategoryService.getCategories().isNotEmpty) {
        categoryList.assignAll(_localCategoryService.getCategories());
      }
      var result = await RemoteCategoryService().get(token!);
      // log(result.body);
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
        _localCategoryService.assignAllCategories(
            categories: categoryListFromJson(result.body));
        // print("getCategories");
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  Future<void> pullRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    getCategories();
  }
}
