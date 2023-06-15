import 'package:hive/hive.dart';
import 'dart:convert';

// part 'product_info.g.dart';

ProductInfo productInfoFromMap(String str) => ProductInfo.fromMap(json.decode(str));

String productInfoToMap(ProductInfo data) => json.encode(data.toMap());

@HiveType(typeId: 1)
class ProductInfo {
    @HiveField(1)
    final int? status;
    @HiveField(2)
    final bool? success;
    @HiveField(3)
    final Data? data;

    ProductInfo({
        this.status,
        this.success,
        this.data,
    });

    factory ProductInfo.fromMap(Map<String, dynamic> json) => ProductInfo(
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
    final String? content;
    @HiveField(9)
    final String? link;
    @HiveField(10)
    final String? nameTh;
    @HiveField(11)
    final String? contentTh;
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
    final List<ProductImage>? productImage;
    @HiveField(21)
    final List<ProductTag>? productTag;

    Data({
        this.id,
        this.sort,
        this.categoryId,
        this.categoryName,
        this.categoryNameTh,
        this.imageLogo,
        this.name,
        this.content,
        this.link,
        this.nameTh,
        this.contentTh,
        this.isActive,
        this.isDelete,
        this.createDate,
        this.createBy,
        this.updateDate,
        this.updateBy,
        this.deleteDate,
        this.deleteBy,
        this.productImage,
        this.productTag,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        createDate: json["createDate"] == null ? null : DateTime.parse(json["createDate"]),
        createBy: json["createBy"],
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        updateBy: json["updateBy"],
        deleteDate: json["deleteDate"] == null ? null : DateTime.parse(json["deleteDate"]),
        deleteBy: json["deleteBy"],
        productImage: json["productImage"] == null ? [] : List<ProductImage>.from(json["productImage"]!.map((x) => ProductImage.fromMap(x))),
        productTag: json["productTag"] == null ? [] : List<ProductTag>.from(json["productTag"]!.map((x) => ProductTag.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "sort": sort,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "categoryNameTh": categoryNameTh,
        "imageLogo": imageLogo,
        "name": name,
        "content": content,
        "link": link,
        "nameTh": nameTh,
        "contentTh": contentTh,
        "isActive": isActive,
        "isDelete": isDelete,
        "createDate": createDate?.toIso8601String(),
        "createBy": createBy,
        "updateDate": updateDate?.toIso8601String(),
        "updateBy": updateBy,
        "deleteDate": deleteDate?.toIso8601String(),
        "deleteBy": deleteBy,
        "productImage": productImage == null ? [] : List<dynamic>.from(productImage!.map((x) => x.toMap())),
        "productTag": productTag == null ? [] : List<dynamic>.from(productTag!.map((x) => x.toMap())),
    };
}

@HiveType(typeId: 3)
class ProductImage {
    @HiveField(1)
    final String? id;
    @HiveField(2)
    final int? sort;
    @HiveField(3)
    final String? productId;
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

    ProductImage({
        this.id,
        this.sort,
        this.productId,
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

    factory ProductImage.fromMap(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        sort: json["sort"],
        productId: json["productId"],
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
        "productId": productId,
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
class ProductTag {
    @HiveField(1)
    final String? tagId;
    @HiveField(2)
    final String? name;
    @HiveField(3)
    final String? imageLogo;
    @HiveField(4)
    final bool? isActive;

    ProductTag({
        this.tagId,
        this.name,
        this.imageLogo,
        this.isActive,
    });

    factory ProductTag.fromMap(Map<String, dynamic> json) => ProductTag(
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
