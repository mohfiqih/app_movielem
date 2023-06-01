import 'package:app_movie/IP/ip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:app_movie/dasbor/film_anak/NavbaraAnak.dart';

class HomePageAnak extends StatefulWidget {
  const HomePageAnak({super.key});

  @override
  State<HomePageAnak> createState() => _HomePageAnakState();
}

class _HomePageAnakState extends State<HomePageAnak> {
  // final flutterWebviewPlugin = FlutterWebviewPlugin();
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Home Page Anak',
        //   style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        // ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 10,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://www.netflix.com/id-en/browse/genre/11177'),
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
      bottomNavigationBar: NavbarAnak(),
    );
  }
}


// import 'package:app_movie/dasbor/film_anak/NavbaraAnak.dart';
// import 'package:app_movie/dasbor/film_dewasa/HomePage.dart';
// import 'package:app_movie/dasbor/film_dewasa/widgets/CustomNavBar.dart';
// import 'package:app_movie/splash/wait.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';

// class HomePageAnak extends StatefulWidget {
//   const HomePageAnak({super.key});

//   @override
//   State<HomePageAnak> createState() => _HomePageAnakState();
// }

// class _HomePageAnakState extends State<HomePageAnak> {
//   late AudioPlayer audioPlayer;

//   String audioPath = 'assets/voice/sapaan.mp3';

//   @override
//   void initState() {
//     super.initState();
//     playSound();
//   }

//   void playSound() async {
//     audioPlayer = AudioPlayer();
//     await audioPlayer.setAsset(audioPath);
//     await audioPlayer.play();
//   }

//   @override
//   void dispose() {
//     audioPlayer.stop();
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // SizedBox(
//                         //   width: 10,
//                         // ),
//                         Text(
//                           "Hi, Movielas",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 23,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           "Dashboard Anak",
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
//                               Icon(
//                                 Icons.notifications,
//                                 color: Color.fromARGB(255, 99, 99, 99),
//                                 size: 30,
//                               ),
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               GestureDetector(
//                                 child: Icon(
//                                   Icons.people_alt_outlined,
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
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       0),
//                                                           child: Container(
//                                                             child: Text(
//                                                               "Berikut data akun anda, jika ingin logout klik tombol logout!",
//                                                               style: TextStyle(
//                                                                 fontSize: 15,
//                                                                 color: Colors
//                                                                     .black,
//                                                               ),
//                                                             ),
//                                                             alignment: Alignment
//                                                                 .centerLeft,
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           height: 30,
//                                                         ),
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       0),
//                                                           child: Container(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .all(7),
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color: Colors
//                                                                   .grey[200],
//                                                               border: Border.all(
//                                                                   color: Colors
//                                                                       .white),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           12),
//                                                             ),
//                                                             child: Padding(
//                                                               padding: EdgeInsets
//                                                                   .only(
//                                                                       left: 10),
//                                                               child: Column(
//                                                                 children: [
//                                                                   TextFormField(
//                                                                     textInputAction:
//                                                                         TextInputAction
//                                                                             .done,
//                                                                     obscureText:
//                                                                         false,
//                                                                     decoration:
//                                                                         InputDecoration(
//                                                                       icon: new Icon(
//                                                                           Icons
//                                                                               .people),
//                                                                       border: InputBorder
//                                                                           .none,
//                                                                       hintText:
//                                                                           '',
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           height: 20,
//                                                         ),
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       0),
//                                                           child: Container(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .all(7),
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color: Colors
//                                                                   .grey[200],
//                                                               border: Border.all(
//                                                                   color: Colors
//                                                                       .white),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           12),
//                                                             ),
//                                                             child: Padding(
//                                                               padding: EdgeInsets
//                                                                   .only(
//                                                                       left: 10),
//                                                               child: Column(
//                                                                 children: [
//                                                                   TextFormField(
//                                                                     textInputAction:
//                                                                         TextInputAction
//                                                                             .done,
//                                                                     obscureText:
//                                                                         true,
//                                                                     decoration:
//                                                                         InputDecoration(
//                                                                       icon: new Icon(
//                                                                           Icons
//                                                                               .email),
//                                                                       border: InputBorder
//                                                                           .none,
//                                                                       hintText:
//                                                                           '',
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(height: 30),
//                                                         InkWell(
//                                                           onTap: () async {
//                                                             // Navigator.of(
//                                                             //         context)
//                                                             //     .pushReplacement(
//                                                             //         MaterialPageRoute(
//                                                             //             builder:
//                                                             //                 (context) =>
//                                                             //                     Wait()));
//                                                             showDialog(
//                                                               context: context,
//                                                               builder:
//                                                                   (BuildContext
//                                                                       context) {
//                                                                 return AlertDialog(
//                                                                   scrollable:
//                                                                       true,
//                                                                   // title: Text(
//                                                                   //     'Profil'),
//                                                                   content:
//                                                                       Padding(
//                                                                     padding:
//                                                                         const EdgeInsets
//                                                                             .all(2),
//                                                                     child: Form(
//                                                                       child:
//                                                                           Column(
//                                                                         children: [
//                                                                           Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.symmetric(horizontal: 0),
//                                                                             child:
//                                                                                 Container(
//                                                                               child: Column(
//                                                                                 children: [
//                                                                                   SizedBox(
//                                                                                     height: 10,
//                                                                                   ),
//                                                                                   Text(
//                                                                                     "Yakin Logout?",
//                                                                                     style: TextStyle(
//                                                                                       fontSize: 15,
//                                                                                       color: Colors.black,
//                                                                                     ),
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     height: 20,
//                                                                                   ),
//                                                                                   InkWell(
//                                                                                     onTap: () async {
//                                                                                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Wait()));
//                                                                                     },
//                                                                                     child: Container(
//                                                                                       child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         children: [
//                                                                                           SizedBox(width: 30),
//                                                                                           Text(
//                                                                                             "Ya",
//                                                                                             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
//                                                                                           ),
//                                                                                           SizedBox(width: 140),
//                                                                                           Icon(
//                                                                                             Icons.done_all_outlined,
//                                                                                             color: Colors.white,
//                                                                                             size: 25,
//                                                                                           ),
//                                                                                         ],
//                                                                                       ),
//                                                                                       height: 60,
//                                                                                       width: double.infinity,
//                                                                                       decoration: BoxDecoration(
//                                                                                         color: Color.fromARGB(255, 0, 120, 167),
//                                                                                         borderRadius: BorderRadius.circular(15),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                   SizedBox(
//                                                                                     height: 20,
//                                                                                   ),
//                                                                                   InkWell(
//                                                                                     onTap: () async {
//                                                                                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePageDewasa()));
//                                                                                     },
//                                                                                     child: Container(
//                                                                                       child: Row(
//                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                         children: [
//                                                                                           SizedBox(width: 30),
//                                                                                           Text(
//                                                                                             "Tidak",
//                                                                                             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
//                                                                                           ),
//                                                                                           SizedBox(width: 110),
//                                                                                           Icon(
//                                                                                             Icons.backspace_sharp,
//                                                                                             color: Colors.white,
//                                                                                             size: 25,
//                                                                                           ),
//                                                                                         ],
//                                                                                       ),
//                                                                                       height: 60,
//                                                                                       width: double.infinity,
//                                                                                       decoration: BoxDecoration(
//                                                                                         color: Color.fromARGB(255, 232, 0, 0),
//                                                                                         borderRadius: BorderRadius.circular(15),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                               // child: Text(
//                                                                               //   "Masukan email login anda saat ini, untuk resend Token Login!",
//                                                                               //   style: TextStyle(
//                                                                               //     fontSize: 15,
//                                                                               //     color: Colors.black,
//                                                                               //   ),
//                                                                               // ),
//                                                                               // alignment: Alignment.centerLeft,
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 );
//                                                               },
//                                                             );
//                                                           },
//                                                           child: Container(
//                                                             child: Row(
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .min,
//                                                               children: [
//                                                                 SizedBox(
//                                                                     width: 30),
//                                                                 Icon(
//                                                                   Icons.logout,
//                                                                   color: Colors
//                                                                       .white,
//                                                                   size: 25,
//                                                                 ),
//                                                                 SizedBox(
//                                                                     width: 60),
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
//                 height: 60,
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 227, 227, 227),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(children: [
//                   SizedBox(width: 10),
//                   Icon(
//                     Icons.search,
//                     color: Color.fromARGB(255, 99, 99, 99),
//                     size: 30,
//                   ),
//                   SizedBox(width: 5),
//                   Container(
//                     width: 300,
//                     margin: EdgeInsets.only(left: 5),
//                     child: TextFormField(
//                       style: TextStyle(color: Color.fromARGB(255, 0, 120, 167)),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Movielas..",
//                         hintStyle: TextStyle(
//                             color: Color.fromARGB(255, 158, 158, 158)),
//                       ),
//                     ),
//                   ),
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: NavbarAnak(),
//     );
//   }
// }
