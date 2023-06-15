import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:app_ecommerce/const.dart';

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/Category';

  Future<dynamic> get(String token) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer $token"
      },
    );;
    // print(response.body);
    return response;
  }
}
