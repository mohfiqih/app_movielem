// import 'dart:async';
// import 'dart:io';
// import 'dart:convert';
// import 'package:app_movie/IP/ip.dart';
// import 'package:app_movie/dasbor/film_anak/Home_anak.dart';
// import 'package:app_movie/dasbor/film_dewasa/HomePage.dart';
// import 'package:app_movie/dasbor/film_remaja/Home_remaja.dart';
// import 'package:app_movie/login/login.dart';
// import 'package:app_movie/splash/load.dart';
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// // import 'package:mic_stream/mic_stream.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// // import 'package:just_audio/just_audio.dart';
// import 'package:flutter_sound/flutter_sound.dart';

// class AudioRecorderScreen extends StatefulWidget {
//   @override
//   _AudioRecorderScreenState createState() => _AudioRecorderScreenState();
// }

// class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
//   late Stream<List<int>> audioStream;

//   bool isRecording = false;

//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = '';
//   String _status = '';
//   double _confidence = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     initializeAudioStream();
//     _speech = stt.SpeechToText();
//   }

//   Future<void> initializeAudioStream() async {
//     await Permission.microphone.request();
//     if (await Permission.microphone.isGranted) {
//       // audioStream = Microphone().audioStream(
//       //   sampleRate: 44100,
//       //   numChannels: 1,
//       // );
//     }
//   }

//   // Future<void> startRecording() async {
//   //   if (!isRecording) {
//   //     setState(() {
//   //       isRecording = true;
//   //     });

//   //     final appDir = await getApplicationDocumentsDirectory();
//   //     final filePath = '${appDir.path}/recording.wav';
//   //     final file = File(filePath);

//   //     await file.create();

//   //     StreamSubscription<List<int>> listener;
//   //     listener = audioStream.listen((samples) {
//   //       file.writeAsBytes(samples);
//   //     });

//   //     setState(() {
//   //       isRecording = true;
//   //     });
//   //   }
//   // }

//   Future<void> uploadAudio(File filePath) async {
//     var stream = http.ByteStream(filePath.openRead());
//     var length = await filePath.length();

//     var uri = Uri.parse(ip_universal + 'save-audio');

//     var request = http.MultipartRequest('POST', uri);
//     var multipartFile = http.MultipartFile(
//       'audio',
//       stream,
//       length,
//       filename: filePath.path.split('/').last,
//     );
//     request.files.add(multipartFile);

//     var response = await request.send();

//     if (response.statusCode == 200) {
//       // print('Audio berhasil dikirim!');
//       // await EasyLoading.showSuccess("Voice berhasil dikirim!");
//       // Navigator.push(context, MaterialPageRoute(builder: (context) => Load()));
//       // var json = jsonDecode(response.body);
//       if (response == 'Halaman Dewasa') {
//         EasyLoading.showError("Halaman Dewasa");
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomePageDewasa()));
//       } else if (response == 'Halaman Remaja') {
//         await EasyLoading.showSuccess("Halaman Remaja");
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomePageRemaja()));
//       } else {
//         await EasyLoading.showSuccess("Halaman Anak");
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomePageAnak()));
//       }
//     } else {
//       print('Audio Gagal dikirim!. Status Code: ${response.statusCode}');
//       await EasyLoading.showError("Voice gagal dikirim!");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 40,
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) => Login()));
//                   },
//                   child: Icon(
//                     Icons.arrow_back,
//                     size: 32,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Center(
//                   child: Text(
//                     "Hi, Movielas",
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Center(
//                 child: Text('---------------------------------------------',
//                     style: TextStyle(fontSize: 3), textAlign: TextAlign.center),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: Text(
//                     'Ucapkan kalimat dibawah ini \n "Hallo Saya sangat senang menikmati aplikasi ini"',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center),
//               ),
//               SizedBox(
//                 height: 80,
//               ),
//               Row(
//                 children: [
//                   const Spacer(),
//                   Expanded(
//                     flex: 30,
//                     child: SvgPicture.asset(
//                       "assets/images/voice.svg",
//                       height: 200,
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//               SizedBox(
//                 height: 70,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
//                 // margin: EdgeInsets.all(),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                     width: 2,
//                   ),
//                 ),
//                 child: Text(
//                   _text,
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         endRadius: 90,
//         animate: _isListening,
//         duration: Duration(milliseconds: 2000),
//         glowColor: Colors.black12,
//         repeat: true,
//         showTwoGlows: true,
//         child: FloatingActionButton(
//           onPressed: _listen,
//           child: CircleAvatar(
//             backgroundColor: Color.fromARGB(255, 0, 120, 167),
//             radius: 35,
//             child: Icon(
//               _isListening ? Icons.stop : Icons.mic_none,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) {
//           print('onStatus: $val');
//         },
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _text = val.recognizedWords;

//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//               // final appDir = getApplicationDocumentsDirectory();
//               // appDir.then(
//               //   (Directory directory) {
//               //     final filePath = '${directory.path}/recording.wav';
//               //     final audioFile = File(filePath);
//               //     if (audioFile.existsSync()) {
//               //       uploadAudio(audioFile);
//               //     } else {
//               //       print('File audio tidak ditemukan.');
//               //     }
//               //   },
//               // );
//             }
//           }),
//         );
//       }
//     } else {
//       setState(() {
//         _isListening = false;
//       });
//       _speech.stop();
//     }
//   }
// }
