import 'package:hive/hive.dart';
import 'dart:convert';

part 'blog.g.dart';

List<Blog> blogListFromJson(String val) => List<Blog>.from(json
    .decode(val)['data']['resultData']
    .map((val) => Blog.blogFromJson(val)));

@HiveType(typeId: 22)
class Blog {
    @HiveField(1)
    String id;
    @HiveField(2)
    int sort;
    @HiveField(3)
    String imageTitle;
    @HiveField(4)
    String title;
    @HiveField(5)
    String content;
    @HiveField(6)
    bool isActive;
    @HiveField(7)
    bool isDelete;
    @HiveField(8)
    DateTime createDate;
    @HiveField(9)
    String createBy;
    @HiveField(10)
    DateTime? updateDate;
    @HiveField(11)
    String? updateBy;
    @HiveField(12)
    DateTime? deleteDate;
    @HiveField(13)
    String? deleteBy;
    @HiveField(14)
    String? titleTh;
    @HiveField(15)
    String? contentTh;

    Blog({
        required this.id,
        required this.sort,
        required this.imageTitle,
        required this.title,
        required this.content,
        required this.isActive,
        required this.isDelete,
        required this.createDate,
        required this.createBy,
        required this.updateDate,
        required this.updateBy,
        required this.deleteDate,
        required this.deleteBy,
        required this.titleTh,
        required this.contentTh,
    });

    factory Blog.blogFromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        sort: json["sort"],
        imageTitle: json["imageTitle"],
        title: json["title"],
        content: json["content"],
        isActive: json["isActive"],
        isDelete: json["isDelete"],
        createDate: DateTime.parse(json["createDate"]),
        createBy: json["createBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        updateBy: json["updateBy"],
        deleteDate: json["deleteDate"] == null
            ? null
            : DateTime.parse(json["deleteDate"]),
        deleteBy: json["deleteBy"] ?? '',
        titleTh: json["titleTh"],
        contentTh: json["contentTh"],
    );

}
