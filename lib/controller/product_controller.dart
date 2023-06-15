import 'package:app_ecommerce/model/product.dart';
import 'package:app_ecommerce/service/remote_service/remote_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../service/local_service/local_auth_service.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading.value = true;
      String? token = LocalAuthService().getToken();
      var result = await RemoteProductService().get(token!);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
      isProductLoading.value = false;
    } finally {
      isProductLoading(false);
      // print(productList.length);
    }
  }

  void getProductByName({required String keyword}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByName(keyword: keyword);
      if (result != null) {
        // productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      // print(productList.length);
    }
  }

  void getProductByCategory({required int id}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByCategory(id: id);
      if (result != null) {
        // productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      // print(productList.length);
    }
  }
  Future<void> pullRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    getProducts();
  }
}
