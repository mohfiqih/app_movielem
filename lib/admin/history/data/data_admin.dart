import 'package:app_movie/IP/ip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DataAdmin extends StatefulWidget {
  const DataAdmin({super.key});

  @override
  State<DataAdmin> createState() => _DataAdminState();
}

class _DataAdminState extends State<DataAdmin> {
  // final flutterWebviewPlugin = FlutterWebviewPlugin();
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Users',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 0, 71, 202),
        toolbarHeight: 60,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(ip_universal + 'webview/history-users'),
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

// class DataAdmin extends StatelessWidget {
//   const DataAdmin({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Data Admin"),
//         backgroundColor: Color.fromARGB(255, 0, 71, 202),
//       ),
//       body: FutureBuilder<List<Admin>>(
//         future: ApiManager().fetchAdmin(),
//         builder: (BuildContext context, AsyncSnapshot<List<Admin>> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return Container(
//                 padding: const EdgeInsets.all(5),
//                 child: DataClass(datalist: snapshot.data as List<Admin>));
//           }
//         },
//       ),
//       bottomNavigationBar: NavbarAdmin(),
//     );
//   }
// }

// class DataClass extends StatelessWidget {
//   const DataClass({Key? key, required this.datalist}) : super(key: key);

//   final List<Admin> datalist;

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
//                       Text(data.email,
//                           style: const TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.w500)),
//                     ),
//                     DataCell(Text(data.name.toString(),
//                         style: const TextStyle(
//                             fontSize: 26, fontWeight: FontWeight.w500))),
//                     DataCell(
//                       Text(data.status_validasi,
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
//   Future<List<Admin>> fetchAdmin() async {
//     final response = await http.get(Uri.parse(ip_universal + 'data-user'));
//     if (response.statusCode == 200) {
//       var result = json.decode(response.body);
//       print(result);
//       List jsonResponse = result["email"] as List;
//       return jsonResponse
//           .map((jsonResponse) => new Admin.fromJson(jsonResponse))
//           .toList();
//     } else {
//       print('Error, Tidak bisa meload Data');
//       print(response.reasonPhrase);
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }

// class Admin {
//   Admin({
//     required this.id,
//     required this.email,
//     required this.name,
//     required this.status_validasi,
//     required this.level,
//     required this.created_at,
//   });

//   int id;
//   String email;
//   String name;
//   String status_validasi;
//   String level;
//   String created_at;

//   factory Admin.fromJson(Map<String, dynamic> json) => Admin(
//         id: json["id"],
//         email: json["email"],
//         name: json["name"],
//         status_validasi: json["status_validasi"],
//         level: json["level"],
//         created_at: json["created_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "name": name,
//         "status_validasi": status_validasi,
//         "level": level,
//         "created_at": created_at
//       };
// }
