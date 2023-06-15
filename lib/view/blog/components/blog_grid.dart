import 'package:flutter/material.dart';
import '../../../model/blog.dart';
import '../../home/components/blog/blog_card.dart';

class BlogGrid extends StatelessWidget {
  final List<Blog> blog;
  const BlogGrid({Key? key, required this.blog}) : super(key: key);

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
      itemCount: blog.length,
      itemBuilder: (context, index) => BlogCard(blog: blog[index]),
    );
  }
}