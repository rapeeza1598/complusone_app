import 'package:app_ecommerce/model/product.dart';
import 'package:app_ecommerce/view/account/account_screen.dart';
import 'package:app_ecommerce/view/category/category_screen.dart';
import 'package:app_ecommerce/view/home/home_screen.dart';
import 'package:app_ecommerce/view/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:app_ecommerce/controller/dashboard_controller.dart';
import 'package:hive/hive.dart';

import '../account/auth/sign_in_screen.dart';
import '../contact/contact_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Check if user is logged in
    bool isLoggedIn = Hive.box("user").get("user") != null;

    // If user is logged in, go to dashboard screen
    if (isLoggedIn) {
      return GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeScreen(),
                // ProductScreen(),
                ContactScreen(),
                // CategoryScreen(),
                AccountScreen()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone), label: 'Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Account')
            ],
            currentIndex: controller.tabIndex,
            onTap: (val) {
              controller.updateIndex(val);
            },
          ),
        ),
      );
    } else {
      // If user is not logged in, go to login screen
      return const SignInScreen();
    }
  }
}
