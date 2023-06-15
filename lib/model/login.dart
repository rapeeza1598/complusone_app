import 'package:hive/hive.dart';
import 'dart:convert';

part 'login.g.dart';

Temperatures temperaturesFromJson(String str) => Temperatures.fromJson(json.decode(str));

String temperaturesToJson(Temperatures data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class Temperatures {
    @HiveField(1)
    int status;
    @HiveField(2)
    bool success;
    @HiveField(3)
    Data data;

    Temperatures({
        required this.status,
        required this.success,
        required this.data,
    });

    factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        status: json["status"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data.toJson(),
    };
}

@HiveType(typeId: 1)
class Data {
    @HiveField(1)
    bool success;
    @HiveField(2)
    dynamic message;
    @HiveField(3)
    String refreshToken;
    @HiveField(4)
    String token;

    Data({
        required this.success,
        this.message,
        required this.refreshToken,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        success: json["success"],
        message: json["message"],
        refreshToken: json["refreshToken"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "refreshToken": refreshToken,
        "token": token,
    };
}
