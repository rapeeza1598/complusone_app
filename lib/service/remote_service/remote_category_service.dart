import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:complusone_app/const.dart';

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/Category?IsActive=true';

  Future<dynamic> get(String token) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    ;
    // print(response.body);
    return response;
  }
}
