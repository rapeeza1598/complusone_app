import 'package:complusone_app/route/app_route.dart';
import 'package:complusone_app/view/account/auth/sign_in_screen.dart';
import 'package:complusone_app/view/dashboard/dashboard_binding.dart';
import 'package:complusone_app/view/dashboard/dashboard_screen.dart';
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
