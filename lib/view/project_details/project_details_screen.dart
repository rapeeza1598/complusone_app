import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:shimmer/shimmer.dart';
import '../../const.dart';
import '../../model/project.dart';
import '../../model/project_info.dart';
import 'components/project_carousel_slider.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Project project;
  const ProjectDetailsScreen({Key? key, required this.project})
      : super(key: key);

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  ProjectInfo? projectInfo = ProjectInfo(data: Data(content: ""));

  Future getInfoProject(String id) async {
    ProjectInfo a;
    try {
      Dio dio = Dio();
      // dio.options.headers['Authorization'] =
      //     'Bearer $token';
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFkOWUyMGUwLTU4NDMtNGMxMy1hNGQyLTU4ZmY1ZWIzN2Q2YyIsImZpcnN0bmFtZSI6InN1cGVyIiwibGFzdG5hbWUiOiJpZG9sIiwicm9sZSI6IjY1NjZhYjU3LWMyOWEtNDVjOC05MDkxLTcwMTc2ZGYwNDhjYiIsImVtYWlsIjoic3VwZXJpZG9sQHRlc3QuY29tIiwic3ViIjoic3VwZXIiLCJqdGkiOiI3ZDc2MjgxOS1kNzRmLTQ0MjAtOWE1ZC0zZjgxMjg4ZTY0MzgiLCJuYmYiOjE2ODY3MzExMDYsImV4cCI6MTY4NzAzMTEwNiwiaWF0IjoxNjg2NzMxMTA2fQ.J-w8UyNEmZXlIMniSrM_xGKLv9vrS5PP5Z5IoFOxhX4';
      Response response = await dio.get("$baseUrl/Project/$id/info");
      if (response.statusCode == 200) {
        a = ProjectInfo.fromMap(response.data);
        projectInfo = a;
        print(projectInfo.toString());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectCarouselSlider(
              image: widget.project.projectImage,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.project.name,
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.project.projectTag.firstWhereOrNull((e) => true) ?? "",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400),
                )),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: HtmlWidget(widget.project.content)),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: projectInfo?.data?.content == ""
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 20,
                          width: 100,
                          color: Colors.white,
                        ),
                      )
                    : HtmlWidget(projectInfo?.data?.content ?? "")),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
