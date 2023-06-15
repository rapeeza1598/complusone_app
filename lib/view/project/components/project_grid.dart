import 'package:flutter/material.dart';
import '../../../model/project.dart';
import '../../home/components/project/project_card.dart';

class ProjectGrid extends StatelessWidget {
  final List<Project> projects;
  const ProjectGrid({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: projects.length,
      itemBuilder: (context, index) => ProjectCard(project: projects[index]),
    );
  }
}