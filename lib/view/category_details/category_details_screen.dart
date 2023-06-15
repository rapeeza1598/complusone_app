import 'dart:convert';
import 'dart:math';

import 'package:app_ecommerce/model/category.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:shimmer/shimmer.dart';

import '../../const.dart';
import '../../model/category_info.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final Categorys category;
  const CategoryDetailsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  Future<ImageProvider> getImage(String url) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return NetworkImage(url);
    } else {
      throw Exception('Failed to get image');
    }
  }

  CategoryInfo? categoryInfo = CategoryInfo(data: Data(content: ""));

  Future getInfoCategory(String id) async {
    CategoryInfo a;
    try {
      Dio dio = Dio();
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFkOWUyMGUwLTU4NDMtNGMxMy1hNGQyLTU4ZmY1ZWIzN2Q2YyIsImZpcnN0bmFtZSI6InN1cGVyIiwibGFzdG5hbWUiOiJpZG9sIiwicm9sZSI6IjY1NjZhYjU3LWMyOWEtNDVjOC05MDkxLTcwMTc2ZGYwNDhjYiIsImVtYWlsIjoic3VwZXJpZG9sQHRlc3QuY29tIiwic3ViIjoic3VwZXIiLCJqdGkiOiI3ZDc2MjgxOS1kNzRmLTQ0MjAtOWE1ZC0zZjgxMjg4ZTY0MzgiLCJuYmYiOjE2ODY3MzExMDYsImV4cCI6MTY4NzAzMTEwNiwiaWF0IjoxNjg2NzMxMTA2fQ.J-w8UyNEmZXlIMniSrM_xGKLv9vrS5PP5Z5IoFOxhX4';
      Response response = await dio.get("$baseUrl/Category/$id/info");
      if (response.statusCode == 200) {
        a = CategoryInfo.fromMap(response.data);
        categoryInfo = a;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  get() async {
    await getInfoCategory(widget.category.id);
    setState(() {});
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: FutureBuilder<ImageProvider>(
                  future: getImage(GETIMAGEURL + widget.category.imageName),
                  builder: (context, snapshot) {
                    try {
                      if (snapshot.connectionState == ConnectionState.done) {
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
                            margin: const EdgeInsets.symmetric(horizontal: 25),
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.category.name,
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: categoryInfo!.data!.content! == ""
                      ? const Text("loading...")
                      : HtmlWidget(categoryInfo!.data!.content!)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
