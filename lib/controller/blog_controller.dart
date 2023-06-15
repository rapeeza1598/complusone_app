import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/blog.dart';
import '../service/local_service/local_auth_service.dart';
import '../service/remote_service/remote_blog.dart';

class BlogController extends GetxController {
  static BlogController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Blog> blogList = List<Blog>.empty(growable: true).obs;
  RxBool isBlogLoading = false.obs;

  @override
  void onInit() {
    getBlog();
    super.onInit();
  }

  void getBlog() async {
    try {
      isBlogLoading.value = true;
      String? token = LocalAuthService().getToken();
      var result = await RemoteBlogService().get(token!);
      if (result != null) {
        blogList.assignAll(blogListFromJson(result.body));
      }
      isBlogLoading.value = false;
    } finally {
      isBlogLoading(false);
      // log(projectList.length as String);
    }
  }

  Future<void> pullRefresh() async {
    try {
      isBlogLoading.value = true;
      String? token = await LocalAuthService().getToken();
      var result = await RemoteBlogService().get(token!);
      if (result != null) {
        blogList.assignAll(blogListFromJson(result.body));
      }
      isBlogLoading.value = false;
    } finally {
      isBlogLoading(false);
      // log(projectList.length as String);
    }
  }
}
