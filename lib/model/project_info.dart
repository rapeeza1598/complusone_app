// To parse this JSON data, do
//
//     final projectInfo = projectInfoFromMap(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

// part 'project_info.g.dart';

ProjectInfo projectInfoFromMap(String str) => ProjectInfo.fromMap(json.decode(str));

String projectInfoToMap(ProjectInfo data) => json.encode(data.toMap());

@HiveType(typeId: 1)
class ProjectInfo {
    @HiveField(1)
    final int? status;
    @HiveField(2)
    final bool? success;
    @HiveField(3)
    final Data? data;

    ProjectInfo({
        this.status,
        this.success,
        this.data,
    });

    factory ProjectInfo.fromMap(Map<String, dynamic> json) => ProjectInfo(
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

@HiveType(typeId: 2)
class Data {
    @HiveField(1)
    final String? id;
    @HiveField(2)
    final int? sort;
    @HiveField(3)
    final String? categoryId;
    @HiveField(4)
    final String? categoryName;
    @HiveField(5)
    final String? categoryNameTh;
    @HiveField(6)
    final String? imageLogo;
    @HiveField(7)
    final String? name;
    @HiveField(8)
    final String? nameTh;
    @HiveField(9)
    final String? content;
    @HiveField(10)
    final String? contentTh;
    @HiveField(11)
    final String? link;
    @HiveField(12)
    final bool? isActive;
    @HiveField(13)
    final bool? isDelete;
    @HiveField(14)
    final DateTime? createDate;
    @HiveField(15)
    final String? createBy;
    @HiveField(16)
    final DateTime? updateDate;
    @HiveField(17)
    final String? updateBy;
    @HiveField(18)
    final DateTime? deleteDate;
    @HiveField(19)
    final String? deleteBy;
    @HiveField(20)
    final List<ProjectImage>? projectImage;
    @HiveField(21)
    final List<ProjectTag>? projectTag;

    Data({
        this.id,
        this.sort,
        this.categoryId,
        this.categoryName,
        this.categoryNameTh,
        this.imageLogo,
        this.name,
        this.nameTh,
        this.content,
        this.contentTh,
        this.link,
        this.isActive,
        this.isDelete,
        this.createDate,
        this.createBy,
        this.updateDate,
        this.updateBy,
        this.deleteDate,
        this.deleteBy,
        this.projectImage,
        this.projectTag,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        sort: json["sort"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        categoryNameTh: json["categoryNameTh"],
        imageLogo: json["imageLogo"],
        name: json["name"],
        nameTh: json["nameTh"],
        content: json["content"],
        contentTh: json["contentTh"],
        link: json["link"],
        isActive: json["isActive"],
        isDelete: json["isDelete"],
        createDate: json["createDate"] == null ? null : DateTime.parse(json["createDate"]),
        createBy: json["createBy"],
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        updateBy: json["updateBy"],
        deleteDate: json["deleteDate"] == null ? null : DateTime.parse(json["deleteDate"]),
        deleteBy: json["deleteBy"],
        projectImage: json["projectImage"] == null ? [] : List<ProjectImage>.from(json["projectImage"]!.map((x) => ProjectImage.fromMap(x))),
        projectTag: json["projectTag"] == null ? [] : List<ProjectTag>.from(json["projectTag"]!.map((x) => ProjectTag.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "sort": sort,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "categoryNameTh": categoryNameTh,
        "imageLogo": imageLogo,
        "name": name,
        "nameTh": nameTh,
        "content": content,
        "contentTh": contentTh,
        "link": link,
        "isActive": isActive,
        "isDelete": isDelete,
        "createDate": createDate?.toIso8601String(),
        "createBy": createBy,
        "updateDate": updateDate?.toIso8601String(),
        "updateBy": updateBy,
        "deleteDate": deleteDate?.toIso8601String(),
        "deleteBy": deleteBy,
        "projectImage": projectImage == null ? [] : List<dynamic>.from(projectImage!.map((x) => x.toMap())),
        "projectTag": projectTag == null ? [] : List<dynamic>.from(projectTag!.map((x) => x.toMap())),
    };
}

@HiveType(typeId: 3)
class ProjectImage {
    @HiveField(1)
    final String? id;
    @HiveField(2)
    final int? sort;
    @HiveField(3)
    final String? projectId;
    @HiveField(4)
    final String? imageName;
    @HiveField(5)
    final bool? isActive;
    @HiveField(6)
    final bool? isDelete;
    @HiveField(7)
    final DateTime? createDate;
    @HiveField(8)
    final String? createBy;
    @HiveField(9)
    final DateTime? updateDate;
    @HiveField(10)
    final String? updateBy;
    @HiveField(11)
    final DateTime? deleteDate;
    @HiveField(12)
    final String? deleteBy;

    ProjectImage({
        this.id,
        this.sort,
        this.projectId,
        this.imageName,
        this.isActive,
        this.isDelete,
        this.createDate,
        this.createBy,
        this.updateDate,
        this.updateBy,
        this.deleteDate,
        this.deleteBy,
    });

    factory ProjectImage.fromMap(Map<String, dynamic> json) => ProjectImage(
        id: json["id"],
        sort: json["sort"],
        projectId: json["projectId"],
        imageName: json["imageName"],
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
        "projectId": projectId,
        "imageName": imageName,
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

@HiveType(typeId: 4)
class ProjectTag {
    @HiveField(1)
    final String? tagId;
    @HiveField(2)
    final String? name;
    @HiveField(3)
    final String? imageLogo;
    @HiveField(4)
    final bool? isActive;

    ProjectTag({
        this.tagId,
        this.name,
        this.imageLogo,
        this.isActive,
    });

    factory ProjectTag.fromMap(Map<String, dynamic> json) => ProjectTag(
        tagId: json["tagId"],
        name: json["name"],
        imageLogo: json["imageLogo"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toMap() => {
        "tagId": tagId,
        "name": name,
        "imageLogo": imageLogo,
        "isActive": isActive,
    };
}
