import 'package:app_ecommerce/view/product/components/product_loading_grid.dart';
import 'package:app_ecommerce/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import '../../controller/project_controller.dart';
import 'components/project_grid.dart';
// import '../../component/main_header.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Project'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await projectController.pullRefresh();
            },
            child: Column(
              children: [
                // const MainHeader(),
                Expanded(child: Obx(() {
                  if (projectController.isProjectLoading.value) {
                    return const ProductLoadingGrid();
                  } else {
                    if (projectController.projectList.isNotEmpty) {
                      return ProjectGrid(
                          projects: projectController.projectList);
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/No data-pana.png'),
                          const SizedBox(height: 10),
                          const Text('Products Not Found!')
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
