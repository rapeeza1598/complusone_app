import 'package:complusone_app/const.dart';
import 'package:dio/dio.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BlogCarouselSlider extends StatefulWidget {
  final List<String> image;
  const BlogCarouselSlider({Key? key, required this.image}) : super(key: key);

  @override
  State<BlogCarouselSlider> createState() => _BlogCarouselSliderState();
}

class _BlogCarouselSliderState extends State<BlogCarouselSlider> {
  int _currentIndex = 0;

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
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
                items: widget.image
                    .map((e) => Container(
                          color: Colors.white,
                          child: FutureBuilder<ImageProvider>(
                            future: getImage(GETIMAGEURL + e),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.data != null) {
                                return Image(
                                  image: snapshot.data!,
                                  fit: BoxFit.contain,
                                );
                              } else {
                                return Shimmer.fromColors(
                                  highlightColor: Colors.white,
                                  baseColor: Colors.grey.shade300,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    color: Colors.grey.shade300,
                                  ),
                                );
                              }
                            },
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.5,
                    viewportFraction: 1,
                    onPageChanged: ((index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }))),
            Positioned(
                child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.image.map((e) {
            int index = widget.image.indexOf(e);
            return Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.grey.shade600
                      : Colors.grey.shade400),
            );
          }).toList(),
        )
      ],
    );
  }
}
