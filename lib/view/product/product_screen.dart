import 'package:app_ecommerce/view/product/components/product_grid.dart';
import 'package:app_ecommerce/view/product/components/product_loading_grid.dart';
import 'package:app_ecommerce/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
// import '../../component/main_header.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await productController.pullRefresh();
            },
            child: Column(
              children: [
                // const MainHeader(),
                Expanded(child: Obx(() {
                  if (productController.isProductLoading.value) {
                    return const ProductLoadingGrid();
                  } else {
                    if (productController.productList.isNotEmpty) {
                      return ProductGrid(
                          products: productController.productList);
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
