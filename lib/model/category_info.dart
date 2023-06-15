import 'package:hive/hive.dart';
import 'dart:convert';

// part 'category.g.dart';

CategoryInfo categoryInfoFromMap(String str) =>
    CategoryInfo.fromMap(json.decode(str));

String categoryInfoToMap(CategoryInfo data) => json.encode(data.toMap());

@HiveType(typeId: 60)
class CategoryInfo {
  @HiveField(1)
  final int? status;
  @HiveField(2)
  final bool? success;
  @HiveField(3)
  final Data? data;

  CategoryInfo({
    this.status,
    this.success,
    this.data,
  });

  factory CategoryInfo.fromMap(Map<String, dynamic> json) => CategoryInfo(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "data": data?.toMap(),
      };
}

@HiveType(typeId: 62)
class Data {
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final int? sort;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final String? imageName;
  @HiveField(5)
  final String? nameTh;
  @HiveField(6)
  final String? content;
  @HiveField(7)
  final String? contentTh;
  @HiveField(8)
  final bool? isActive;
  @HiveField(9)
  final bool? isDelete;
  @HiveField(10)
  final DateTime? createDate;
  @HiveField(11)
  final String? createBy;
  @HiveField(12)
  final DateTime? updateDate;
  @HiveField(13)
  final String? updateBy;
  @HiveField(14)
  final DateTime? deleteDate;
  @HiveField(15)
  final String? deleteBy;

  Data({
    this.id,
    this.sort,
    this.name,
    this.imageName,
    this.nameTh,
    this.content,
    this.contentTh,
    this.isActive,
    this.isDelete,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.deleteDate,
    this.deleteBy,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
            ? DateTime.timestamp()
            : DateTime.parse(json["updateDate"]),
        updateBy: json["updateBy"],
        deleteDate: json["deleteDate"] == null
            ? DateTime.timestamp()
            : DateTime.parse(json["deleteDate"]),
        deleteBy: json["deleteBy"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "sort": sort,
        "name": name,
        "imageName": imageName,
        "nameTh": nameTh,
        "content": content,
        "contentTh": contentTh,
        "isActive": isActive,
        "isDelete": isDelete,
        "createDate": createDate?.toIso8601String(),
        "createBy": createBy,
        "updateDate": updateDate?.toIso8601String(),
        "updateBy": updateBy,
        "deleteDate": deleteDate?.toIso8601String(),
        "deleteBy": deleteBy,
      };
}
