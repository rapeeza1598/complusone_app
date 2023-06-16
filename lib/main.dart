import 'package:complusone_app/model/ad_banner.dart';
import 'package:complusone_app/model/category.dart';
import 'package:complusone_app/model/product.dart';
import 'package:complusone_app/model/user.dart';
import 'package:complusone_app/route/app_page.dart';
import 'package:complusone_app/route/app_route.dart';
import 'package:complusone_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //register adapters
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategorysAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(UserAdapter());

  await Hive.openBox("user");
  await Hive.openBox('token');
  await Hive.openBox('refreshToken');
  configLoading();
  // runApp(const MyApp());
  // await Hive.openBox("user");
  // User? user = Hive.box("user").get("user");
  // if (user == null) {
  //   runApp(
  //     const MaterialApp(
  //       home: SignInScreen(),
  //     ),
  //   );
  // } else {
  runApp(const MyApp());

  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.List,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}
