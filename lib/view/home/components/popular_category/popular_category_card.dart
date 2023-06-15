import 'package:app_ecommerce/view/category_details/category_details_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_ecommerce/const.dart';
import 'package:app_ecommerce/model/category.dart';
import 'package:shimmer/shimmer.dart';

class PopularCategoryCard extends StatelessWidget {
  final Categorys category;
  const PopularCategoryCard({Key? key, required this.category})
      : super(key: key);

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
    int categoryCardWidth = size.width.toInt();
    int categoryCardHeight = (size.width / 16 * 9).toInt();
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CategoryDetailsScreen(category: category)));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
          child: FutureBuilder<ImageProvider>(
            future: getImage(
                "$GETIMAGEURL${category.imageName}&width=$categoryCardWidth&height=$categoryCardHeight&keepRatio=true"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final image = snapshot.data!;
                  return Material(
                    elevation: 8,
                    shadowColor: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 270,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken),
                            image: image,
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              category.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              } else {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 270,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}
