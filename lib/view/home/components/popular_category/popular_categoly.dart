import 'package:app_ecommerce/view/home/components/popular_category/popular_category_card.dart';
import 'package:flutter/material.dart';
import 'package:app_ecommerce/model/category.dart';

class PopularCategory extends StatelessWidget {
  final List<Categorys> categories;
  const PopularCategory({Key? key,
    required this.categories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) => PopularCategoryCard(
            category: categories[index]
          )),
    );
  }
}
