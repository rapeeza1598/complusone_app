import 'package:complusone_app/const.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class RemotePopularProduct {
  var client = http.Client();
  var remoteUrl = '$baseUrl/Product?IsActive=true';

  Future<dynamic> get(String token) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}
