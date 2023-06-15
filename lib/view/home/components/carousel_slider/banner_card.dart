import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../const.dart';

class BannerCard extends StatelessWidget {
  final String imageUrl;
  const BannerCard({Key? key, required this.imageUrl}) : super(key: key);

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
    //get image screen size
    final size = MediaQuery.of(context).size;
    int bannerWidth = size.width.toInt();
    int bannerHeight = (size.width / 16 * 9).toInt();
    // print(bannerWidth);
    // print(bannerHeight);
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: FutureBuilder<ImageProvider>(
          future: getImage(
              "$GETIMAGEURL$imageUrl&width=$bannerWidth&height=$bannerHeight&keepRatio=true"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Image(
                  image: snapshot.data!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              } else {
                return Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey.shade300,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              }
            } else {
              return Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.shade300,
                child: const SizedBox(
                  height: 100,
                  width: double.infinity,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
