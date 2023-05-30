// import 'dart:convert';
// import 'package:app_movie/IP/ip.dart';
// import 'package:app_movie/admin/history/model/model_gender.dart';
// import 'package:http/http.dart' as http;

// class GenderApi {
//   Future GenderAPI() async {
//     var client = http.Client();
//     var uri = Uri.parse(ip_universal + "data-gender");
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       return genderFromJson(json);
//     }
//   }
// }
