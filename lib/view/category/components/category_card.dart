import 'package:app_ecommerce/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../model/category.dart';
import '../../category_details/category_details_screen.dart';


class CategoryCard extends StatelessWidget {
  final Categorys category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

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
    int category_card_width = size.width.toInt();
    int category_card_height = (size.width / 16 * 9).toInt();
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CategoryDetailsScreen(category: category)));
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
                      future: getImage(
                          "$GETIMAGEURL${category.imageName}&width=$category_card_width&height=$category_card_height&keepRatio=true"),
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
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
