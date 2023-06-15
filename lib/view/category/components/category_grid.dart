import 'package:flutter/material.dart';
import '../../../model/category.dart';
import 'category_card.dart';

class CategoryGrid extends StatelessWidget {
  final List<Categorys> category;
  const CategoryGrid({Key? key, required this.category}) : super(key: key);

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
      itemCount: category.length,
      itemBuilder: (context, index) => CategoryCard(category: category[index]),
    );
  }
}