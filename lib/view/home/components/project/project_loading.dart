import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'project_loading_card.dart';

class ProjectLoading extends StatelessWidget {
  const ProjectLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => const ProjectLoadingCard()),
    );
  }
}
