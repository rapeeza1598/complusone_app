import 'package:complusone_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../../controller/blog_controller.dart';
import 'components/blog_grid.dart';
import 'components/blog_loading_grid.dart';
// import '../../component/main_header.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BlogController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await blogController.pullRefresh();
            },
            child: Column(
              children: [
                // const MainHeader(),
                Expanded(child: Obx(() {
                  if (blogController.isBlogLoading.value) {
                    return const BlogLoadingGrid();
                  } else {
                    if (blogController.blogList.isNotEmpty) {
                      return BlogGrid(blog: blogController.blogList);
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/No data-pana.png'),
                          const SizedBox(height: 10),
                          const Text('Blog Not Found!')
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
