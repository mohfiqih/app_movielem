import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/admin/history/data_user/model_user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<User>> getAllUser({int page = 1, int pageSize = 10}) async {
    var client = http.Client();
    var uri =
        Uri.parse(ip_universal + "data-user?page=$page&pageSize=$pageSize");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return UserFromJson(json);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
