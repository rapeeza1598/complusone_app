import 'package:app_ecommerce/route/app_route.dart';
import 'package:app_ecommerce/view/account/auth/sign_in_screen.dart';
import 'package:app_ecommerce/view/dashboard/dashboard_binding.dart';
import 'package:app_ecommerce/view/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

class AppPage {
  static var List = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    // GetPage(name: AppRoute.login, page: () => const SignInScreen(), binding: DashboardBinding()),
  ];
}
