import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:complusone_app/controller/controller.dart';

import 'components/category_grid.dart';
import 'components/category_loading_grid.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await categoryController.pullRefresh();
            },
            child: Column(
              children: [
                // const MainHeader(),
                Expanded(child: Obx(() {
                  if (categoryController.isCategoryLoading.value) {
                    return const CategoryLoadingGrid();
                  } else {
                    if (categoryController.categoryList.isNotEmpty) {
                      return CategoryGrid(
                          category: categoryController.categoryList);
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/No data-pana.png'),
                          const SizedBox(height: 10),
                          const Text('Category Not Found!')
                        ],
                      );
                    }
                  }
                })),
              ],
            ),
          ),
        ));
  }
}
