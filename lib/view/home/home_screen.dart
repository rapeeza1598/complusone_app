import 'package:app_ecommerce/controller/controller.dart';
// import 'package:app_ecommerce/view/account/auth/sign_in_screen.dart';
// import 'package:app_ecommerce/view/home/components/Blog/blog_loading_card.dart';
import 'package:app_ecommerce/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:app_ecommerce/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:app_ecommerce/view/home/components/popular_category/popular_categoly.dart';
import 'package:app_ecommerce/view/home/components/popular_category/popular_category_loading.dart';
import 'package:app_ecommerce/view/home/components/popular_product/popular_product_loading.dart';
import 'package:app_ecommerce/view/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../component/main_header.dart';
// import '../../controller/auth_controller.dart';
import 'components/blog/blog_item.dart';
import 'components/blog/blog_loading.dart';
import 'components/popular_product/popular_product.dart';
import 'components/project/project_item.dart';
import 'components/project/project_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    homeController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        // const MainHeader(),
        Expanded(
            child: RefreshIndicator(
          onRefresh: () async {
            await homeController.fetchData();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(() {
                  if (homeController.bannerList.isNotEmpty) {
                    return CarouselSliderView(
                        bannerList: homeController.bannerList);
                  } else {
                    return const CarouselLoading();
                  }
                }),
                const SectionTitle(title: "Category"),
                Obx(() {
                  if (homeController.CategoryList.isNotEmpty) {
                    return PopularCategory(
                        categories: homeController.CategoryList);
                  } else {
                    return const PopularCategoryLoading();
                  }
                }),
                const SectionTitle(
                  title: "Product",
                ),
                Obx(() {
                  if (homeController.popularProductList.isNotEmpty) {
                    return PopularProduct(
                        popularProducts: homeController.popularProductList);
                  } else {
                    return const PopularProductLoading();
                  }
                }),
                const SectionTitle(title: "News"),
                Obx(() {
                  if (homeController.blogList.isNotEmpty) {
                    return BlogItem(blog: homeController.blogList);
                  } else {
                    return const BlogLoading();
                  }
                }),
                const SectionTitle(title: "Project"),
                Obx(() {
                  if (homeController.projectList.isNotEmpty) {
                    return ProjectItem(projectItem: homeController.projectList);
                  } else {
                    return const ProjectLoading();
                  }
                }),
              ],
            ),
          ),
        ))
      ],
    ));
  }
}
