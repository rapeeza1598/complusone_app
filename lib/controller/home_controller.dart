import 'package:complusone_app/model/ad_banner.dart';
import 'package:complusone_app/model/category.dart';
import 'package:complusone_app/model/product.dart';
import 'package:complusone_app/service/local_service/local_ad_banner_service.dart';
import 'package:complusone_app/service/remote_service/remote_bannerservice.dart';
import 'package:complusone_app/service/remote_service/remote_category_service.dart';
import 'package:complusone_app/service/remote_service/remote_popular_product_service.dart';
import 'package:complusone_app/service/remote_service/remote_project.dart';
import 'package:get/get.dart';

import '../model/blog.dart';
import '../model/contact.dart';
import '../model/project.dart';
import '../service/local_service/local_auth_service.dart';
import '../service/remote_service/remote_blog.dart';
import '../service/remote_service/remote_contact.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Categorys> CategoryList = List<Categorys>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxList<Project> projectList = List<Project>.empty(growable: true).obs;
  RxList<Blog> blogList = List<Blog>.empty(growable: true).obs;
  RxList<Contact> contactList = List<Contact>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  RxBool isProjectLoading = false.obs;
  RxBool isBlogLoading = false.obs;
  RxBool isContactLoading = false.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();

  @override
  void onInit() async {
    await _localAdBannerService.init();
    getAdBanners();
    getPopularCategory();
    getPopularProduct();
    getProject();
    getBlog();
    getContact();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      //assigning local ad banners before fetching from remote
      // if (_localAdBannerService.getAdBanners().isNotEmpty) {
      //   bannerList.assignAll(_localAdBannerService.getAdBanners());
      // }
      //call api
      String? token = LocalAuthService().getToken();
      var result = await RemoteBannerService().get(token!);
      if (result != null) {
        //assigning api response to banner list
        bannerList.assignAll(adBannerListFormJson(result.body));
        //save to local
        _localAdBannerService.assignAllAdBanners(
            adBanners: adBannerListFormJson(result.body));
      }
    } finally {
      // print(bannerList.first.image);
      isBannerLoading(false);
    }
  }

  void getPopularCategory() async {
    try {
      isPopularCategoryLoading(true);
      String? token = LocalAuthService().getToken();
      var result = await RemoteCategoryService().get(token!);
      // log(result.body);
      if (result != null) {
        CategoryList.assignAll(categoryListFromJson(result.body));
      }
    } finally {
      // print(popularCategoryList);
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);
      String? token = LocalAuthService().getToken();
      var result = await RemotePopularProduct().get(token!);
      if (result != null) {
        popularProductList.assignAll(productListFromJson(result.body));
      }
    } finally {
      // print(popularProductList.length);
      isPopularProductLoading(false);
    }
  }

  void getBlog() async {
    try {
      isBlogLoading(true);
      String? token = LocalAuthService().getToken();
      var result = await RemoteBlogService().get(token!);
      if (result != null) {
        blogList.assignAll(blogListFromJson(result.body));
      }
    } finally {
      isBlogLoading(false);
    }
  }

  void getProject() async {
    try {
      isProjectLoading(true);
      String? token = LocalAuthService().getToken();
      var result = await RemoteProjectService().get(token!);
      if (result != null) {
        projectList.assignAll(projectListFromJson(result.body));
      }
    } finally {
      isProjectLoading(false);
    }
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

  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    getAdBanners();
    getPopularCategory();
    getPopularProduct();
    getProject();
    getBlog();
    getContact();
  }
}
