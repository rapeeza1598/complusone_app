import 'dart:convert';
import 'package:hive/hive.dart';

part 'product.g.dart';

// List<Product> productListFromJson(String val) =>
//     List<Product>.from(json
//         .decode(val)['data']['resultData']
//         .map((val) => Product.productFromJson(val)));

// @HiveType(typeId: 3)
// class Product {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   final String name;
//   @HiveField(2)
//   final String description;
//   @HiveField(3)
//   final List<String> image;
//   @HiveField(4)
//   final List<Tag> tags;

//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.image,
//     required this.tags,
//   });

//   factory Product.productFromJson(Map<String, dynamic> data) => Product(
//       id: data['id'],
//       name: data['attributes']['name'],
//       description: data['attribute']['description'],
//       image: List<String>.from(data['attributes']['image']['data']
//           .map((image) => image['attributes']['url'])),
//       tags: List<Tag>.from(data['attributes']['tags']['data'].map((val) => Tag.fromJson(val)))
//   );
// }

List<Product> productListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']['resultData']
    .map((val) => Product.productFromJson(val)));

@HiveType(typeId: 82)
class Product {
  @HiveField(1)
  String id;
  @HiveField(2)
  int sort;
  @HiveField(3)
  String categoryId;
  @HiveField(4)
  String categoryName;
  @HiveField(5)
  String categoryNameTh;
  @HiveField(6)
  String imageLogo;
  @HiveField(7)
  String name;
  @HiveField(8)
  String content;
  @HiveField(9)
  String link;
  @HiveField(10)
  String nameTh;
  @HiveField(11)
  String contentTh;
  @HiveField(12)
  bool isActive;
  @HiveField(13)
  bool isDelete;
  @HiveField(14)
  DateTime? createDate;
  @HiveField(15)
  String? createBy;
  @HiveField(16)
  DateTime? updateDate;
  @HiveField(17)
  String? updateBy;
  @HiveField(18)
  DateTime? deleteDate;
  @HiveField(19)
  String? deleteBy;
  @HiveField(20)
  List<String> productImage;
  @HiveField(21)
  List<String> productTag;

  Product({
    required this.id,
    required this.sort,
    required this.categoryId,
    required this.categoryName,
    required this.categoryNameTh,
    required this.imageLogo,
    required this.name,
    required this.content,
    required this.link,
    required this.nameTh,
    required this.contentTh,
    required this.isActive,
    required this.isDelete,
    required this.createDate,
    required this.createBy,
    required this.updateDate,
    required this.updateBy,
    required this.deleteDate,
    required this.deleteBy,
    required this.productImage,
    required this.productTag,
  });
  factory Product.productFromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sort: json["sort"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        categoryNameTh: json["categoryNameTh"],
        imageLogo: json["imageLogo"],
        name: json["name"],
        content: json["content"],
        link: json["link"],
        nameTh: json["nameTh"],
        contentTh: json["contentTh"],
        isActive: json["isActive"],
        isDelete: json["isDelete"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        createBy: json["createBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        updateBy: json["updateBy"],
        deleteDate: json["deleteDate"] == null
            ? null
            : DateTime.parse(json["deleteDate"]),
        deleteBy: json["deleteBy"],
        productImage: List<String>.from(json["productImage"]
            .map((productImage) => productImage['imageName'])),
        productTag: List<String>.from(
            json["productTag"].map((productTag) => productTag['name'])),
      );
}
