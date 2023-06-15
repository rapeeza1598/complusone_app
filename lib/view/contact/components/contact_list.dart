import 'package:flutter/material.dart';
import '../../../model/contact.dart';
import 'contact_card.dart';

class ContactGrid extends StatelessWidget {
  final List<Contact> contact;
  const ContactGrid({Key? key, required this.contact}) : super(key: key);

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
      itemCount: contact.length,
      itemBuilder: (context, index) => ContactCard(contact: contact[index]),
    );
  }
}