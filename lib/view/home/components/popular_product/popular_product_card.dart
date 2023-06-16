import 'package:complusone_app/view/product_details/product_details_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:complusone_app/const.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../model/product.dart';

class PopularProductCard extends StatelessWidget {
  final Product product;
  const PopularProductCard({Key? key, required this.product}) : super(key: key);

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
    final size = MediaQuery.of(context).size;
    int product_card_width = size.width.toInt();
    int product_card_height = (size.width / 16 * 9).toInt();
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: product)));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
          child: Material(
            elevation: 8,
            shadowColor: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 120,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 0.9,
                    child: FutureBuilder<ImageProvider>(
                      future: getImage(
                          "$GETIMAGEURL${product.imageLogo}&width=$product_card_width&height=$product_card_height&keepRatio=true"),
                      builder: (context, snapshot) {
                        try {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Image(
                              image: snapshot.data!,
                              fit: BoxFit.cover,
                            );
                          } else {
                            return Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey.shade300,
                              child: Container(
                                color: Colors.grey,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                              ),
                            );
                          }
                        } catch (e) {
                          return const Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.grey,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          color: Color(0xFF13027D), fontSize: 14),
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
