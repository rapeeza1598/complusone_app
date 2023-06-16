import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:complusone_app/const.dart';

class RemoteProjectService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/Project?IsActive=true';

  Future<dynamic> get(String token) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    // log(response.toString());
    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=images,tags&filters[name][\$contains]=$keyword'));
    return response;
  }

  Future<dynamic> getByCategory({required int id}) async {
    var response = await client.get(
        Uri.parse('$remoteUrl?populate=images,tags&filters[category][id]=$id'));

    return response;
  }
}
