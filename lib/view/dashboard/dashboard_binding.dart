import 'package:app_ecommerce/controller/auth_controller.dart';
import 'package:app_ecommerce/controller/category_controller.dart';
import 'package:app_ecommerce/controller/contact_controller.dart';
import 'package:app_ecommerce/controller/dashboard_controller.dart';
import 'package:app_ecommerce/controller/home_controller.dart';
import 'package:app_ecommerce/controller/product_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.put(ContactController());
  }
}
