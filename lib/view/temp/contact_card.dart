import 'package:complusone_app/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  const ContactCard({Key? key, required this.contact}) : super(key: key);

  Future<ImageProvider> getImage(String url) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return NetworkImage(url);
    } else {
      throw Exception('Failed to get image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             ProductDetailsScreen(product: product)));
        },
        child: Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: Center(
                    child: FutureBuilder<ImageProvider>(
                      future: getImage(GETIMAGEURL + contact.imageLogo),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return Image(
                              image: snapshot.data!,
                              fit: BoxFit.cover,
                            );
                          } else {
                            return const Center(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.grey,
                              ),
                            );
                          }
                        } else {
                          return Shimmer.fromColors(
                            highlightColor: Colors.white,
                            baseColor: Colors.grey.shade300,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.grey.shade300,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contact.name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        contact.link,
                        style:
                            const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      //add button center card link to contact.link
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              Uri url = Uri.parse(contact.link);
                              if (contact.name.toLowerCase() == 'email') {
                                url = Uri.parse('mailto:${contact.link}');
                              }
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child:
                                Center(child: Text('Open to ${contact.name}')),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
