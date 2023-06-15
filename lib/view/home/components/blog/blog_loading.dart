import 'package:app_ecommerce/view/home/components/blog/blog_loading_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BlogLoading extends StatelessWidget {
  const BlogLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const BlogLoadingCard()),
    );
  }
}