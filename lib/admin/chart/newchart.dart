// import 'package:app_movie/IP/ip.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class DataPage extends StatefulWidget {
//   @override
//   _DataPageState createState() => _DataPageState();
// }

// class _DataPageState extends State<DataPage> {
//   Map<String, int> data = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse(ip_universal + 'grafik-jeniskelamin'));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       setState(() {
//         data = Map<String, int>.from(jsonData);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Page'),
//       ),
//       body: Center(
//         child: data.isEmpty
//             ? CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Data Jumlah Jenis Kelamin:',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 20),
//                   ...data.entries.map(
//                     (entry) => Text('${entry.key}: ${entry.value}'),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: DataPage(),
//   ));
// }

import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;

class NewChart extends StatefulWidget {
  @override
  _NewChartState createState() => _NewChartState();
}

// -------------------- Class --------------------- //
class ChartData {
  final String jenisKelamin;
  final int jumlah;

  ChartData(this.jenisKelamin, this.jumlah);
}

class RentangUmur {
  final String rentangumur;
  final int jumlahrentang;

  RentangUmur(this.rentangumur, this.jumlahrentang);
}

class GrafikLabel {
  late final String label;
  late final int jumlahlabel;

  GrafikLabel(this.label, this.jumlahlabel);
}

// -------------------- ----------------------//
class _NewChartState extends State<NewChart> {
  List<charts.Series<ChartData, String>> seriesList = [];
  List<charts.Series<RentangUmur, String>> rentangumur = [];
  List<charts.Series<GrafikLabel, String>> grafik_label = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    rentangUmur();
    grafiklabel();
  }

  // Jenis Kelamin
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse(ip_universal + 'grafik-jeniskelamin'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<ChartData> data = [];
      for (var entry in jsonData.entries) {
        final chartData = ChartData(entry.key, entry.value);
        data.add(chartData);
      }

      setState(() {
        seriesList = [
          charts.Series<ChartData, String>(
            id: 'Jenis Kelamin',
            domainFn: (ChartData data, _) => data.jenisKelamin,
            measureFn: (ChartData data, _) => data.jumlah,
            colorFn: (ChartData data, _) =>
                charts.MaterialPalette.blue.shadeDefault,
            data: data,
          ),
        ];
      });
    }
  }

  // Rentang Umur
  Future<void> rentangUmur() async {
    final response =
        await http.get(Uri.parse(ip_universal + 'grafik-rentangumur'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<RentangUmur> rentang = [];
      for (var entry in jsonData.entries) {
        final chartData = RentangUmur(entry.key, entry.value);
        rentang.add(chartData);
      }

      setState(() {
        rentangumur = [
          charts.Series<RentangUmur, String>(
            id: 'Rentang Umur',
            domainFn: (RentangUmur rentang, _) => rentang.rentangumur,
            measureFn: (RentangUmur rentang, _) => rentang.jumlahrentang,
            colorFn: (RentangUmur rentang, _) =>
                charts.MaterialPalette.blue.shadeDefault,
            data: rentang,
          ),
        ];
      });
    }
  }

  // Label
  Future<void> grafiklabel() async {
    final response = await http.get(Uri.parse(ip_universal + 'grafik-label'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<GrafikLabel> label = [];
      for (var entry in jsonData.entries) {
        final chartData = GrafikLabel(entry.key, entry.value);
        label.add(chartData);
      }

      setState(() {
        grafik_label = [
          charts.Series<GrafikLabel, String>(
            id: 'Grafik Label',
            domainFn: (GrafikLabel label, _) => label.label,
            measureFn: (GrafikLabel label, _) => label.jumlahlabel,
            colorFn: (GrafikLabel rentang, _) =>
                charts.MaterialPalette.blue.shadeDefault,
            data: label,
          ),
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Grafik Data",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Analisis Data Aplikasi",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.settings,
                                  color: Color.fromARGB(255, 99, 99, 99),
                                  size: 30,
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        title: Text('Profil'),
                                        content: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Form(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 0),
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            // Navigator.of(
                                                            //         context)
                                                            //     .pushReplacement(
                                                            //         MaterialPageRoute(
                                                            //             builder:
                                                            //                 (context) =>
                                                            //                     Wait()));
                                                          },
                                                          child: Container(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                SizedBox(
                                                                    width: 30),
                                                                Text(
                                                                  "Logout",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          17),
                                                                ),
                                                                SizedBox(
                                                                    width: 100),
                                                                Icon(
                                                                  Icons.update,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 25,
                                                                ),
                                                              ],
                                                            ),
                                                            height: 60,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      120,
                                                                      167),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 20, bottom: 30, top: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Grafik Jenis Kelamin",
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: charts.BarChart(seriesList, animate: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 20, bottom: 30, top: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Grafik Rentang Umur",
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: charts.BarChart(rentangumur, animate: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 20, bottom: 30, top: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Grafik Label",
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: charts.BarChart(grafik_label, animate: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavbarAdmin(),
    );
  }
}
