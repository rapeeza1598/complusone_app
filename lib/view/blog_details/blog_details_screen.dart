import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:shimmer/shimmer.dart';

import '../../const.dart';
import '../../model/blog.dart';
import '../../model/blog_info.dart';
import 'components/blog_carousel_slider.dart';

class BlogDetailsScreen extends StatefulWidget {
  final Blog blog;
  const BlogDetailsScreen({Key? key, required this.blog}) : super(key: key);

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  Future<ImageProvider> getImage(String url) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return NetworkImage(url);
    } else {
      throw Exception('Failed to get image');
    }
  }

  BlogInfo? blogInfo = BlogInfo(data: Data(content: ""));

  Future getInfoBlog(String id) async {
    BlogInfo a;
    try {
      Dio dio = Dio();
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFkOWUyMGUwLTU4NDMtNGMxMy1hNGQyLTU4ZmY1ZWIzN2Q2YyIsImZpcnN0bmFtZSI6InN1cGVyIiwibGFzdG5hbWUiOiJpZG9sIiwicm9sZSI6IjY1NjZhYjU3LWMyOWEtNDVjOC05MDkxLTcwMTc2ZGYwNDhjYiIsImVtYWlsIjoic3VwZXJpZG9sQHRlc3QuY29tIiwic3ViIjoic3VwZXIiLCJqdGkiOiI3ZDc2MjgxOS1kNzRmLTQ0MjAtOWE1ZC0zZjgxMjg4ZTY0MzgiLCJuYmYiOjE2ODY3MzExMDYsImV4cCI6MTY4NzAzMTEwNiwiaWF0IjoxNjg2NzMxMTA2fQ.J-w8UyNEmZXlIMniSrM_xGKLv9vrS5PP5Z5IoFOxhX4';
      // dio.options.headers['Authorization'] =
      //     'Bearer $token';
      Response response = await dio.get("$baseUrl/News/$id/info");
      if (response.statusCode == 200) {
        a = BlogInfo.fromMap(response.data);
        blogInfo = a;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  get() async {
    await getInfoBlog(widget.blog.id);
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
        title: Text(widget.blog.title),
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
                  future: getImage(GETIMAGEURL + widget.blog.imageTitle),
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
                  widget.blog.title,
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: HtmlWidget(
                    blogInfo!.data!.content!,
                    textStyle: const TextStyle(fontSize: 16),
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
