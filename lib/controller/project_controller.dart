import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/project.dart';
import '../service/local_service/local_auth_service.dart';
import '../service/remote_service/remote_project.dart';

class ProjectController extends GetxController {
  static ProjectController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Project> projectList = List<Project>.empty(growable: true).obs;
  RxBool isProjectLoading = false.obs;

  @override
  void onInit() {
    getProject();
    super.onInit();
  }

  void getProject() async {
    try {
      isProjectLoading.value = true;
      String? token = LocalAuthService().getToken();
      var result = await RemoteProjectService().get(token!);
      if (result != null) {
        projectList.assignAll(projectListFromJson(result.body));
      }
      isProjectLoading.value = false;
    } finally {
      isProjectLoading(false);
      // log(projectList.length as String);
    }
  }

  Future<void> pullRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    getProject();
  }
}
