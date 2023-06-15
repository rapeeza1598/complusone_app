import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/contact.dart';
import '../service/local_service/local_auth_service.dart';
import '../service/remote_service/remote_contact.dart';

class ContactController extends GetxController {
  static ContactController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Contact> contactList = List<Contact>.empty(growable: true).obs;
  RxBool isContactLoading = false.obs;

  @override
  void onInit() {
    getContact();
    super.onInit();
  }

  void getContact() async {
    try {
      isContactLoading.value = true;
      String? token = LocalAuthService().getToken();
      var result = await RemoteContactService().get(token!);
      if (result != null) {
        contactList.assignAll(contactListFromJson(result.body));
      }
      isContactLoading.value = false;
    } finally {
      isContactLoading(false);
      // print(productList.length);
    }
  }

  Future<void> pullRefresh() async {
    try {
      String? token = LocalAuthService().getToken();
      isContactLoading.value = true;
      var result = await RemoteContactService().get(token!);
      if (result != null) {
        contactList.assignAll(contactListFromJson(result.body));
      }
      isContactLoading.value = false;
    } finally {
      isContactLoading(false);
      // print(productList.length);
    }
  }
}
