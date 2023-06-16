import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:complusone_app/const.dart';

class RemoteContactService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/Contact?IsActive=true';

  Future<dynamic> get(String token) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    // log(response.toString() as num);
    return response;
  }
}
