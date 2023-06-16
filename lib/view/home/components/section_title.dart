import 'package:complusone_app/view/category/category_screen.dart';
import 'package:flutter/material.dart';

import '../../blog/blog_screen.dart';
import '../../product/product_screen.dart';
import '../../project/project_screen.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Color(0xFF13027D)),
          ),
          TextButton(
            onPressed: () {
              if (title.toLowerCase() == "category") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryScreen()));
              } else if (title.toLowerCase() == "product") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductScreen()));
              } else if (title.toLowerCase() == "news") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BlogScreen()));
              } else if (title.toLowerCase() == "project") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProjectScreen()));
              } else {
                Navigator.pushNamed(context, "/page");
              }
            },
            child: const Text(
              "View All",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange),
            ),
          )
        ],
      ),
    );
  }
}

    // return Padding(
    //     padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           title,
    //           style: const TextStyle(fontSize: 18, color: Colors.orange),
    //         ),
    //         TextButton(
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => Page(title),
    //               ),
    //             );
    //           },
    //           child: const Text(
    //             "See More",
    //             style: TextStyle(fontSize: 16, color: Colors.blue),
    //           ),
    //         ),
    //       ],
    //     ));

// class Page extends StatefulWidget {
//   final String title;
//   Page(this.title, {super.key});

//   @override
//   State<Page> createState() => _PageState();
// }

// class _PageState extends State<Page> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.title.toLowerCase() == "category") {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: const Center(
//           child: Text("This is the category page."),
//         ),
//       );
//     } else if(widget.title.toLowerCase() == "product") {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: const Center(
//           child: Text("This is the product page."),
//         ),
//       );
//     }
//     else if(widget.title.toLowerCase() == "blogs"){
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: const Center(
//           child: Text("This is the blogs."),
//         ),
//       );
//     }
//     else if(widget.title.toLowerCase() == "project"){
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: const Center(
//           child: Text("This is the project."),
//         ),
//       );
//     }
//     else{
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: const Center(
//           child: Text("This is the page."),
//         ),
//       );
//     }
//   }
// }

// class Page extends StatelessWidget {
//   final String title;
//   Page(this.title, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: SingleChildScrollView(
//         physics: const NeverScrollableScrollPhysics(),
//         child: Container(
          // decoration: kBackground,
          // child: RefreshIndicator(
            // onRefresh: pullRefresh,
            // child: ListView(
            //   primary: false,
            //   shrinkWrap: true,
            //   physics: const BouncingScrollPhysics(),
            //   children: [
            //     Stack(
            //       alignment: Alignment.centerRight,
            //       children: <Widget>[
            //         Padding(
            //           padding: const EdgeInsets.all(10),
            //           child: TextField(
            //             decoration: const InputDecoration(
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: kMainColor),
                          // ),
                          // focusedBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: kMainColor),
                          // ),
                //           prefixIcon: Icon(Icons.search),
                //           hintText: 'Search',
                //           hintStyle: TextStyle(
                //             fontSize: 13,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: isIpad == true
                //       ? EdgeInsets.only(
                //           bottom: 78,
                //           left: queryData.size.width / 4,
                //           right: queryData.size.width / 4)
                //       : EdgeInsets.only(
                //           bottom: 78,
                //           left: queryData.size.width / 50,
                //           right: queryData.size.width / 50),
                //   child: !isLoading
                //       ? newsList.isNotEmpty && !isLoading
                //           ? searchResult.isNotEmpty ||
                //                   controller.text.isNotEmpty
                //               ? MyNewsCard(
                //                   newsList: searchResult,
                //                   pullRefresh: pullRefresh,
                //                   isIpad: isIpad,
                //                   queryData: queryData)
                //               : MyNewsCard(
                //                   newsList: newsList,
                //                   pullRefresh: pullRefresh,
                //                   isIpad: isIpad,
                //                   queryData: queryData)
                //           : const Center(child: Text("ไม่มีข้อมูล"))
                //       : kLoading,
                // ),
              // ],
            // ),
          // ),
        // ),
      // ),
    // );
  // }
// }
