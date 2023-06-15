import 'package:app_ecommerce/view/home/components/project/project_card.dart';
import 'package:flutter/material.dart';

import '../../../../model/project.dart';

class ProjectItem extends StatelessWidget {
  final List<Project> projectItem;
  const ProjectItem({Key? key, required this.projectItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: projectItem.length,
          itemBuilder: (context, index) => ProjectCard(project: projectItem[index])),
    );
  }
}