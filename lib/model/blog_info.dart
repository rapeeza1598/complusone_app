import 'package:hive/hive.dart';
import 'dart:convert';

// part 'blog_info.g.dart';

BlogInfo blogInfoFromMap(String str) => BlogInfo.fromMap(json.decode(str));

String blogInfoToMap(BlogInfo data) => json.encode(data.toMap());

@HiveType(typeId: 51)
class BlogInfo {
    @HiveField(1)
    final int? status;
    @HiveField(2)
    final bool? success;
    @HiveField(3)
    final Data? data;

    BlogInfo({
        this.status,
        this.success,
        this.data,
    });

    factory BlogInfo.fromMap(Map<String, dynamic> json) => BlogInfo(
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

@HiveType(typeId: 52)
class Data {
    @HiveField(1)
    final String? id;
    @HiveField(2)
    final int? sort;
    @HiveField(3)
    final String? imageTitle;
    @HiveField(4)
    final String? title;
    @HiveField(5)
    final String? content;
    @HiveField(6)
    final String? titleTh;
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
        this.imageTitle,
        this.title,
        this.content,
        this.titleTh,
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
        imageTitle: json["imageTitle"],
        title: json["title"],
        content: json["content"],
        titleTh: json["titleTh"],
        contentTh: json["contentTh"],
        isActive: json["isActive"],
        isDelete: json["isDelete"],
        createDate: json["createDate"] == null ? null : DateTime.parse(json["createDate"]),
        createBy: json["createBy"],
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        updateBy: json["updateBy"],
        deleteDate: json["deleteDate"] == null ? null : DateTime.parse(json["deleteDate"]),
        deleteBy: json["deleteBy"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "sort": sort,
        "imageTitle": imageTitle,
        "title": title,
        "content": content,
        "titleTh": titleTh,
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
