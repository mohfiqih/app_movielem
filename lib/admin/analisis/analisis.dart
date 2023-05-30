import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Analisis extends StatefulWidget {
  const Analisis({super.key});

  @override
  State<Analisis> createState() => _AnalisisState();
}

class _AnalisisState extends State<Analisis> {
  // final flutterWebviewPlugin = FlutterWebviewPlugin();
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analisis',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 60,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'http://192.168.206.106:8502'), // Ganti dengan URL Streamlit yang sesuai
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
// import 'package:app_movie/admin/navbar_admin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Analisis extends StatefulWidget {
//   const Analisis({super.key});

//   @override
//   State<Analisis> createState() => _AnalisisState();
// }

// class _AnalisisState extends State<Analisis> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Analisis Data"),
//         backgroundColor: Color.fromARGB(255, 0, 71, 202),
//       ),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 10, right: 10),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: Image.asset(
//                           "assets/images/dasbor/analisis.jpg",
//                           height: 290,
//                           width: 370,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: Container(
//       //   margin: EdgeInsets.only(right: 20, bottom: 10),
//       //   child: FloatingActionButton(
//       //     onPressed: () {
//       //       showDialog(
//       //         context: context,
//       //         builder: (BuildContext context) {
//       //           return AlertDialog(
//       //             scrollable: true,
//       //             title: Text('Tambah Catatan'),
//       //             content: Padding(
//       //               padding: const EdgeInsets.all(2),
//       //               child: Form(
//       //                 child: Column(
//       //                   children: [
//       //                     Padding(
//       //                       padding: const EdgeInsets.symmetric(horizontal: 0),
//       //                       child: Container(
//       //                         child: Column(
//       //                           children: [
//       //                             InkWell(
//       //                               onTap: () async {},
//       //                               child: Container(
//       //                                 child: Row(
//       //                                   mainAxisSize: MainAxisSize.min,
//       //                                   children: [
//       //                                     SizedBox(width: 30),
//       //                                     Text(
//       //                                       "Logout",
//       //                                       style: TextStyle(
//       //                                           fontWeight: FontWeight.bold,
//       //                                           color: Colors.white,
//       //                                           fontSize: 17),
//       //                                     ),
//       //                                     SizedBox(width: 100),
//       //                                     Icon(
//       //                                       Icons.update,
//       //                                       color: Colors.white,
//       //                                       size: 25,
//       //                                     ),
//       //                                   ],
//       //                                 ),
//       //                                 height: 60,
//       //                                 width: double.infinity,
//       //                                 decoration: BoxDecoration(
//       //                                   color: Color.fromARGB(255, 0, 71, 202),
//       //                                   borderRadius: BorderRadius.circular(15),
//       //                                 ),
//       //                               ),
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ],
//       //                 ),
//       //               ),
//       //             ),
//       //           );
//       //         },
//       //       );
//       //     },
//       //     tooltip: 'Tambah',
//       //     child: const Icon(Icons.add),
//       //     backgroundColor: Color.fromARGB(255, 0, 71, 202),
//       //   ),
//       // ),
//       bottomNavigationBar: NavbarAdmin(),
//     );
//   }
// }
