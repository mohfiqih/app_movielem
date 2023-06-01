import 'package:app_movie/IP/ip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grafik Data',
          style: TextStyle(color: Color.fromARGB(255, 249, 249, 249)),
        ),
        backgroundColor: Color.fromARGB(255, 0, 71, 202),
        toolbarHeight: 60,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('http://192.168.0.105:8501/'),
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
// import 'dart:convert';

// import 'package:app_movie/IP/ip.dart';
// import 'package:app_movie/admin/chart/model_chart.dart';
// import 'package:app_movie/admin/navbar_admin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:http/http.dart' as http;
// import 'package:fl_chart/fl_chart.dart';

// class Chart extends StatefulWidget {
//   const Chart({super.key});

//   @override
//   State<Chart> createState() => _ChartState();
// }

// class _ChartState extends State<Chart> {
//   //inisialisasi variabel
//   List<GenderModel> genders = [];
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     getData();
//     getStatus();
//   }

//   void getData() async {
//     //get data api
//     var response = await http.get(
//       Uri.parse(
//         ip_universal + "data-user?level[]=Administrator&level[]=User",
//       ),
//     );

//     List data = json.decode(response.body);

//     setState(() {
//       genders = genderModelFromJson(data);
//       loading = false;
//     });
//   }

//   //setting diagram/chart
//   List<charts.Series<GenderModel, String>> _berdasarkanlevel() {
//     return [
//       //charts.Series memiliki 4 paramter wajib
//       charts.Series<GenderModel, String>(
//         data: genders,
//         id: 'gender',
//         domainFn: (GenderModel genderModel, _) => genderModel.level,
//         measureFn: (GenderModel genderModel, _) => genderModel.total,
//         colorFn: (GenderModel genderModel, _) =>
//             charts.MaterialPalette.blue.shadeDefault,
//       )
//     ];
//   }

//   List<GenderModel> status = [];

//   void getStatus() async {
//     //get data api
//     var response = await http.get(
//       Uri.parse(
//         ip_universal +
//             "data-user?status_validasi[]=Valid&status_validasi[]=Belum Validasi",
//       ),
//     );

//     List data_status = json.decode(response.body);

//     setState(() {
//       status = genderModelFromJson(data_status);
//       loading = false;
//     });
//   }

//   List<charts.Series<GenderModel, String>> _berdasarkanStatus() {
//     return [
//       //charts.Series memiliki 4 paramter wajib
//       charts.Series<GenderModel, String>(
//         data: status,
//         id: 'status',
//         domainFn: (GenderModel genderModel, _) => genderModel.status_validasi,
//         measureFn: (GenderModel genderModel, _) => genderModel.total,
//         colorFn: (GenderModel genderModel, _) =>
//             charts.MaterialPalette.green.shadeDefault,
//       )
//     ];
//   }

//   List<PieChartSectionData> getSectionData(double screenWidth) {
//     double radius = screenWidth / 3.5;
//     return [
//       PieChartSectionData(
//         value: 50,
//         title: '50 Orang \n Laki-Laki',
//         radius: radius,
//         titleStyle: TextStyle(color: Colors.white),
//         color: Colors.blueAccent,
//       ),
//       PieChartSectionData(
//         value: 35,
//         title: '35 Orang \n Perempuan',
//         titleStyle: TextStyle(color: Colors.white),
//         radius: radius,
//         color: Colors.red,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Charts",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 23,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           "Analisis Data Aplikasi",
//                           style: TextStyle(
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 child: Icon(
//                                   Icons.settings,
//                                   color: Color.fromARGB(255, 99, 99, 99),
//                                   size: 30,
//                                 ),
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return AlertDialog(
//                                         scrollable: true,
//                                         title: Text('Profil'),
//                                         content: Padding(
//                                           padding: const EdgeInsets.all(2),
//                                           child: Form(
//                                             child: Column(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets
//                                                       .symmetric(horizontal: 0),
//                                                   child: Container(
//                                                     child: Column(
//                                                       children: [
//                                                         InkWell(
//                                                           onTap: () async {
//                                                             // Navigator.of(
//                                                             //         context)
//                                                             //     .pushReplacement(
//                                                             //         MaterialPageRoute(
//                                                             //             builder:
//                                                             //                 (context) =>
//                                                             //                     Wait()));
//                                                           },
//                                                           child: Container(
//                                                             child: Row(
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .min,
//                                                               children: [
//                                                                 SizedBox(
//                                                                     width: 30),
//                                                                 Text(
//                                                                   "Logout",
//                                                                   style: TextStyle(
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold,
//                                                                       color: Colors
//                                                                           .white,
//                                                                       fontSize:
//                                                                           17),
//                                                                 ),
//                                                                 SizedBox(
//                                                                     width: 100),
//                                                                 Icon(
//                                                                   Icons.update,
//                                                                   color: Colors
//                                                                       .white,
//                                                                   size: 25,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             height: 60,
//                                                             width:
//                                                                 double.infinity,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color: Color
//                                                                   .fromARGB(
//                                                                       255,
//                                                                       0,
//                                                                       120,
//                                                                       167),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           15),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 350,
//                 padding: EdgeInsets.only(right: 15, left: 15),
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 20, bottom: 30, top: 0),
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           "Statisktik Berdasarkan Level Pengguna",
//                         ),
//                         SizedBox(height: 20),
//                         Expanded(
//                           child: charts.BarChart(_berdasarkanlevel(),
//                               animate: true),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 350,
//                 padding: EdgeInsets.only(right: 15, left: 15),
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 20, bottom: 30, top: 30),
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           "Statisktik Pie Berdasarkan Gender",
//                         ),
//                         SizedBox(height: 20),
//                         Expanded(
//                           child: PieChart(PieChartData(
//                               centerSpaceRadius: 0,
//                               borderData: FlBorderData(show: false),
//                               sections: getSectionData(
//                                   MediaQuery.of(context).size.width))),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 350,
//                 padding: EdgeInsets.only(right: 15, left: 15),
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 20, bottom: 30, top: 30),
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           "Statisktik Berdasarkan Status Validasi",
//                         ),
//                         SizedBox(height: 20),
//                         Expanded(
//                           child: charts.BarChart(_berdasarkanStatus(),
//                               animate: true),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: NavbarAdmin(),
//     );
//   }
// }

