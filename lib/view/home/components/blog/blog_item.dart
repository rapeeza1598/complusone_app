import 'package:flutter/material.dart';
import '../../../../model/blog.dart';
import 'blog_card.dart';

class BlogItem extends StatelessWidget {
  final List<Blog> blog;
  const BlogItem({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: blog.length,
          itemBuilder: (context, index) => BlogCard(blog: blog[index])),
    );
  }
}