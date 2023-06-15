import 'dart:convert';
import 'package:hive/hive.dart';

part 'contact.g.dart';

List<Contact> contactListFromJson(String val) => List<Contact>.from(json
    .decode(val)['data']['resultData']
    .map((val) => Contact.contactFromJson(val)));

@HiveType(typeId: 82)
class Contact {
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final int? sort;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String link;
  @HiveField(5)
  final String imageLogo;
  @HiveField(6)
  final bool? isActive;
  @HiveField(7)
  final bool? isDelete;
  @HiveField(8)
  final DateTime? createDate;
  @HiveField(9)
  final String? createBy;
  @HiveField(10)
  final DateTime? updateDate;
  @HiveField(11)
  final String? updateBy;
  @HiveField(12)
  final DateTime? deleteDate;
  @HiveField(13)
  final String? deleteBy;

  Contact({
    required this.id,
    required this.sort,
    required this.name,
    required this.link,
    required this.imageLogo,
    required this.isActive,
    required this.isDelete,
    required this.createDate,
    required this.createBy,
    required this.updateDate,
    required this.updateBy,
    required this.deleteDate,
    required this.deleteBy,
  });
  factory Contact.contactFromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        sort: json["sort"],
        name: json["name"],
        link: json["link"],
        imageLogo: json["imageLogo"],
        isActive: json["isActive"],
        isDelete: json["isDelete"],
        createDate: DateTime.parse(json["createDate"]),
        createBy: json["createBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        updateBy: json["updateBy"],
        deleteDate: json["deleteDate"] == null
            ? null
            : DateTime.parse(json["deleteDate"]),
        deleteBy: json["deleteBy"],
      );
}
