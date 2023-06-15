import 'dart:convert';
import 'package:hive/hive.dart';

part 'category.g.dart';

List<Categorys> categoryListFromJson(String val) => List<Categorys>.from(json
    .decode(val)['data']['resultData']
    .map((category) => Categorys.CategoryFromJson(category)));

@HiveType(typeId: 92)
class Categorys {
  @HiveField(1)
  String id;
  @HiveField(2)
  int? sort;
  @HiveField(3)
  String name;
  @HiveField(4)
  String imageName;
  @HiveField(5)
  String? nameTh;
  @HiveField(6)
  String content;
  @HiveField(7)
  String? contentTh;
  @HiveField(8)
  bool? isActive;
  @HiveField(9)
  bool? isDelete;
  @HiveField(10)
  DateTime? createDate;
  @HiveField(11)
  String? createBy;
  @HiveField(12)
  DateTime? updateDate;
  @HiveField(13)
  String? updateBy;
  @HiveField(14)
  DateTime? deleteDate;
  @HiveField(15)
  String? deleteBy;

  Categorys({
    required this.id,
    required this.sort,
    required this.name,
    required this.imageName,
    required this.nameTh,
    required this.content,
    required this.contentTh,
    required this.isActive,
    required this.isDelete,
    required this.createDate,
    required this.createBy,
    required this.updateDate,
    required this.updateBy,
    required this.deleteDate,
    required this.deleteBy,
  });

  factory Categorys.CategoryFromJson(Map<String, dynamic> json) => Categorys(
        id: json["id"],
        sort: json["sort"],
        name: json["name"],
        imageName: json["imageName"],
        nameTh: json["nameTh"],
        content: json["content"],
        contentTh: json["contentTh"],
        isActive: json["isActive"],
        isDelete: json["isDelete"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        createBy: json["createBy"],
        updateDate: json["updateDate"] == null
            ? null
            : DateTime.parse(json["updateDate"]),
        updateBy: json["updateBy"],
        deleteDate: json["deleteDate"] == null
            ? null
            : DateTime.parse(json["deleteDate"]),
        deleteBy: json["deleteBy"],
      );
}
