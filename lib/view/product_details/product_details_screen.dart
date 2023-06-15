
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../const.dart';
import '../../model/product.dart';
import '../../model/product_info.dart';
import 'components/product_carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductInfo? productInfo = ProductInfo(data: Data(content: ""));

  Future getInfoProduct(String id) async {
    ProductInfo a;
    try {
      Dio dio = Dio();
      // dio.options.headers['Authorization'] =
      //     'Bearer $token';
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFkOWUyMGUwLTU4NDMtNGMxMy1hNGQyLTU4ZmY1ZWIzN2Q2YyIsImZpcnN0bmFtZSI6InN1cGVyIiwibGFzdG5hbWUiOiJpZG9sIiwicm9sZSI6IjY1NjZhYjU3LWMyOWEtNDVjOC05MDkxLTcwMTc2ZGYwNDhjYiIsImVtYWlsIjoic3VwZXJpZG9sQHRlc3QuY29tIiwic3ViIjoic3VwZXIiLCJqdGkiOiI3ZDc2MjgxOS1kNzRmLTQ0MjAtOWE1ZC0zZjgxMjg4ZTY0MzgiLCJuYmYiOjE2ODY3MzExMDYsImV4cCI6MTY4NzAzMTEwNiwiaWF0IjoxNjg2NzMxMTA2fQ.J-w8UyNEmZXlIMniSrM_xGKLv9vrS5PP5Z5IoFOxhX4';
      Response response = await dio.get("$baseUrl/Product/$id/info");
      if (response.statusCode == 200) {
        a = ProductInfo.fromMap(response.data);
        productInfo = a;
        print(productInfo.toString());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  get() async {
    await getInfoProduct(widget.product.id);
    setState(() {});
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCarouselSlider(
              image: widget.product.productImage,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.product.name,
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.product.productTag.first,
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            // const SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //             border: Border.all(width: 1),
            //             borderRadius:
            //                 const BorderRadius.all(Radius.circular(8))),
            // child: Row(
            //   children: [
            // InkWell(
            //   onTap: () {
            //     if (_qty > 1) {
            //       setState(() {
            //         _qty--;
            //       });
            //     }
            //   },
            //   child: Icon(
            //     Icons.keyboard_arrow_left_sharp,
            //     size: 32,
            //     color: Colors.grey.shade800,
            //   ),
            // ),
            // Text(
            //   formatter.format(_qty),
            //   style: TextStyle(
            //       fontSize: 18, color: Colors.grey.shade800),
            // ),
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       _qty++;
            //     });
            //   },
            //   child: Icon(
            //     Icons.keyboard_arrow_right_sharp,
            //     size: 32,
            //     color: Colors.grey.shade800,
            //   ),
            // )
            //     ],
            //   ),
            // ),
            // const SizedBox(width: 10),
            // Container(
            //   decoration: BoxDecoration(
            //       border: Border.all(width: 1),
            //       borderRadius:
            //           const BorderRadius.all(Radius.circular(8))),
            //   child: Row(
            //     children: [
            // InkWell(
            //   onTap: () {
            //     if (_tagIndex > 0) {
            //       setState(() {
            //         _tagIndex--;
            //       });
            //     }
            //   },
            //   child: Icon(
            //     Icons.keyboard_arrow_left_sharp,
            //     size: 32,
            //     color: Colors.grey.shade800,
            //   ),
            // ),
            // Text(
            //   widget.product.tags[_tagIndex].title,
            //   style: TextStyle(
            //       fontSize: 18, color: Colors.grey.shade800),
            // ),
            // InkWell(
            //   onTap: () {
            //     if (_tagIndex != (widget.product.tags.length - 1)) {
            //       setState(() {
            //         _tagIndex++;
            //       });
            //     }
            //   },
            //   child: Icon(
            //     Icons.keyboard_arrow_right_sharp,
            //     size: 32,
            //     color: Colors.grey.shade800,
            //   ),
            // )
            //     ],
            //   ),
            // )
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Text(
            //     'About this product:',
            //     style: TextStyle(
            //         fontSize: 16,
            //         color: Theme.of(context).primaryColor,
            //         fontWeight: FontWeight.w500),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Text(
            //     widget.product.content,
            //     style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            //   ),
            // )
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: productInfo?.data?.content == ""
                    ? const Text("loading...")
                    : HtmlWidget(productInfo?.data?.content ?? "")),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: TextButton(
      //     style: ButtonStyle(
      //       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      //       backgroundColor:
      //           MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
      //     ),
      //     onPressed: () {},
      //     child: const Padding(
      //       padding: EdgeInsets.all(6.0),
      //       child: Text(
      //         'Add to Card',
      //         style: TextStyle(fontSize: 16),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
