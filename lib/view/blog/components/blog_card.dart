import 'package:app_ecommerce/const.dart';
import 'package:app_ecommerce/model/product.dart';
import 'package:app_ecommerce/view/product_details/product_details_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  Future<ImageProvider> getImage(String url) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return NetworkImage(url);
    } else {
      throw Exception('Failed to get image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: product)));
        },
        child: Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: Center(
                    child: FutureBuilder<ImageProvider>(
                      future: getImage(GETIMAGEURL + product.imageLogo),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return Image(
                              image: snapshot.data!,
                              fit: BoxFit.cover,
                            );
                          } else {
                            return const Center(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.grey,
                              ),
                            );
                          }
                        } else {
                          return Shimmer.fromColors(
                            highlightColor: Colors.white,
                            baseColor: Colors.grey.shade300,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.grey.shade300,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(height: 5),
                      for (var i = 0; i < product.productTag.length; i++)
                        Text(
                          product.productTag[i],
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                      // Text(
                      //   '\$${product.productTag}',
                      //   style:
                      //       const TextStyle(fontSize: 12, color: Colors.grey),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}