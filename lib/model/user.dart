import 'dart:convert';
import 'package:hive/hive.dart';

part 'user.g.dart';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// @HiveType(typeId: 4)
// class User {
//   @HiveField(0)
//   String id;
//   @HiveField(1)
//   String fullName;
//   @HiveField(2)
//   String email;
//   @HiveField(3)
//   String image;
//   @HiveField(4)
//   DateTime? birthDay;

//   User(
//       {required this.id,
//       required this.fullName,
//       required this.email,
//       required this.image,
//       required this.birthDay});

//   factory User.fromJson(Map<String, dynamic> User) => User(
//       id: User['id'],
//       fullName: User['fullName'],
//       email: User['email'],
//       image: User['image'] == null ? null : User['image']['url'],
//       birthDay: User['age'] == null ? null : DateTime.parse(User['age']));
// }

// To parse this JSON User, do
//
//     final welcome = welcomeFromMap(jsonString);

@HiveType(typeId: 5)
class User {
  @HiveField(1)
  String id;
  @HiveField(2)
  String firstName;
  @HiveField(3)
  String lastName;
  @HiveField(4)
  String email;
  @HiveField(5)
  String imageName;
  @HiveField(6)
  String phoneNumber;
  @HiveField(7)
  String companyName;
  @HiveField(8)
  String roleId;
  @HiveField(9)
  String roleName;
  @HiveField(10)
  bool isActive;
  @HiveField(11)
  bool isDelete;
  @HiveField(12)
  DateTime createDate;
  @HiveField(13)
  String createBy;
  @HiveField(14)
  DateTime updateDate;
  @HiveField(15)
  String updateBy;
  @HiveField(16)
  DateTime? deleteDate;
  @HiveField(17)
  String? deleteBy;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageName,
    required this.phoneNumber,
    required this.companyName,
    required this.roleId,
    required this.roleName,
    required this.isActive,
    required this.isDelete,
    required this.createDate,
    required this.createBy,
    required this.updateDate,
    required this.updateBy,
    required this.deleteDate,
    required this.deleteBy,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['data']["id"],
        firstName: json['data']["firstName"],
        lastName: json['data']["lastName"],
        email: json['data']["email"],
        imageName: json['data']["imageName"],
        phoneNumber: json['data']["phoneNumber"],
        companyName: json['data']["companyName"],
        roleId: json['data']["roleId"],
        roleName: json['data']["roleName"],
        isActive: json['data']["isActive"],
        isDelete: json['data']["isDelete"],
        createDate: DateTime.parse(json['data']["createDate"]),
        createBy: json['data']["createBy"],
        updateDate: DateTime.parse(json['data']["updateDate"]),
        updateBy: json['data']["updateBy"],
        deleteDate: json['data']["deleteDate"] == null
            ? null
            : DateTime.parse(json['data']["deleteDate"]),
        deleteBy: json['data']["deleteBy"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "imageName": imageName,
        "phoneNumber": phoneNumber,
        "companyName": companyName,
        "roleId": roleId,
        "roleName": roleName,
        "isActive": isActive,
        "isDelete": isDelete,
        "createDate": createDate.toIso8601String(),
        "createBy": createBy,
        "updateDate": updateDate.toIso8601String(),
        "updateBy": updateBy,
        "deleteDate": deleteDate,
        "deleteBy": deleteBy,
      };
}
