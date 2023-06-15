import 'package:flutter/material.dart';
import 'contact_loading_card.dart';

class ContactLoadingGrid extends StatelessWidget {
  const ContactLoadingGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: 6,
      itemBuilder: (context,index) => const ContactLoadingCard(),
    );
  }
}
