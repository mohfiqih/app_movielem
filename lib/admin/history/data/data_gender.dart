import 'package:app_movie/IP/ip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DataGender extends StatefulWidget {
  const DataGender({super.key});

  @override
  State<DataGender> createState() => _DataGenderState();
}

class _DataGenderState extends State<DataGender> {
  // final flutterWebviewPlugin = FlutterWebviewPlugin();
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Gender',
          style: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
        ),
        backgroundColor: Color.fromARGB(255, 0, 71, 202),
        toolbarHeight: 60,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(ip_universal + 'webview/history-gender'),
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
        onWebViewCreated: (controller) {
          webviewController = controller;
        },
      ),
      bottomNavigationBar: NavbarAdmin(),
    );
  }
}

// import 'package:app_movie/IP/ip.dart';
// import 'package:app_movie/admin/navbar_admin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class DataGender extends StatelessWidget {
//   const DataGender({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Data Gender"),
//         backgroundColor: Color.fromARGB(255, 0, 71, 202),
//       ),
//       body: FutureBuilder<List<Gender>>(
//         future: ApiManager().fetchGender(),
//         builder: (BuildContext context, AsyncSnapshot<List<Gender>> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return Container(
//                 padding: const EdgeInsets.all(5),
//                 child: DataClass(datalist: snapshot.data as List<Gender>));
//           }
//         },
//       ),
//       bottomNavigationBar: NavbarAdmin(),
//     );
//   }
// }

// class DataClass extends StatelessWidget {
//   const DataClass({Key? key, required this.datalist}) : super(key: key);

//   final List<Gender> datalist;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: FittedBox(
//         child: DataTable(
//           sortColumnIndex: 1,
//           showCheckboxColumn: false,
//           border: TableBorder.all(width: 1.0),
//           columns: const [
//             DataColumn(
//               label: Text("Jenis Kelamin"),
//             ),
//             DataColumn(
//               label: Text("Rentang Umur"),
//             ),
//             DataColumn(
//               label: Text("Label"),
//             ),
//             DataColumn(
//               label: Text("Action"),
//             ),
//           ],
//           rows: datalist
//               .map(
//                 (data) => DataRow(
//                   cells: [
//                     DataCell(
//                       Text(data.jenis_kelamin,
//                           style: const TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.w500)),
//                     ),
//                     DataCell(Text(data.rentang_umur.toString(),
//                         style: const TextStyle(
//                             fontSize: 26, fontWeight: FontWeight.w500))),
//                     DataCell(
//                       Text(data.label,
//                           style: const TextStyle(
//                               fontSize: 26, fontWeight: FontWeight.w500)),
//                     ),
//                     DataCell(
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.delete,
//                             color: Colors.red,
//                             size: 25,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(
//                             Icons.edit_note_outlined,
//                             color: Colors.blue,
//                             size: 25,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//               .toList(), // converting at last into list.
//         ),
//       ),
//     );
//   }
// }

// class ApiManager {
//   Future<List<Gender>> fetchGender() async {
//     final response = await http.get(Uri.parse(ip_universal + 'data-gender'));
//     if (response.statusCode == 200) {
//       var result = json.decode(response.body);
//       print(result);
//       List jsonResponse = result["jenis_kelamin"] as List;
//       return jsonResponse
//           .map((jsonResponse) => new Gender.fromJson(jsonResponse))
//           .toList();
//     } else {
//       print('Error, Tidak bisa meload Data');
//       print(response.reasonPhrase);
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }

// class Gender {
//   Gender({
//     required this.id,
//     required this.jenis_kelamin,
//     required this.rentang_umur,
//     required this.label,
//     required this.date_created,
//   });

//   late int id;
//   late String jenis_kelamin;
//   late String rentang_umur;
//   late String label;
//   late String date_created;

//   factory Gender.fromJson(Map<String, dynamic> json) => Gender(
//         id: json['id'],
//         jenis_kelamin: json['jenis_kelamin'],
//         rentang_umur: json['rentang_umur'],
//         label: json['label'],
//         date_created: json['date_created'],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "jenis_kelamin": jenis_kelamin,
//         "rentang_umur": rentang_umur,
//         "label": label,
//         "date_created": date_created,
//       };
// }
