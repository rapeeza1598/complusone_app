import 'dart:convert';
import 'package:hive/hive.dart';

part 'ad_banner.g.dart';

List<AdBanner> adBannerListFormJson(String val) => List<AdBanner>.from(json
    .decode(val)['data']['resultData']
    .map((banner) => AdBanner.formJson(banner)));

@HiveType(typeId: 100)
class AdBanner {
  @HiveField(1)
  final String id;
  @HiveField(2)
  final int sort;
  @HiveField(3)
  final String imageName;
  @HiveField(4)
  final bool isActive;
  @HiveField(5)
  final bool isDelete;
  @HiveField(6)
  final DateTime? createDate;
  @HiveField(7)
  final String? createBy;
  @HiveField(8)
  final DateTime? updateDate;
  @HiveField(9)
  final String? updateBy;
  @HiveField(10)
  final DateTime? deleteDate;
  @HiveField(11)
  final String? deleteBy;

  AdBanner({
    required this.id,
    required this.sort,
    required this.imageName,
    required this.isActive,
    required this.isDelete,
    required this.createDate,
    required this.createBy,
    required this.updateDate,
    required this.updateBy,
    required this.deleteDate,
    required this.deleteBy,
  });

  factory AdBanner.formJson(Map<String, dynamic> json) => AdBanner(
        id: json["id"],
        sort: json["sort"],
        imageName: json["imageName"],
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
