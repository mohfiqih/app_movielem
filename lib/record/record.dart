import 'dart:convert';

import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/login/login.dart';
import 'package:app_movie/splash/load.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../otp/skip_/color.dart';
import 'package:app_movie/dasbor/notif.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Speech());
}

class Speech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Recognition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  String _status = '';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    "Hi, Movielas",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text('---------------------------------------------',
                    style: TextStyle(fontSize: 3), textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                    'Ucapkan apa saja untuk mengklasifikasikan suara anda! enjoy your life.',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 110,
              ),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 30,
                    child: SvgPicture.asset(
                      "assets/images/voice.svg",
                      height: 200,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              // FloatingActionButton(
              //   onPressed: () {},
              //   child: CircleAvatar(
              //     backgroundColor: Color.fromARGB(255, 0, 120, 167),
              //     radius: 35,
              //     child: Icon(
              //       Icons.upload,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                // margin: EdgeInsets.all(),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                ),
                child: Text(
                  _text,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      // Button Audio
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 90,
        animate: _isListening,
        duration: Duration(milliseconds: 2000),
        glowColor: Colors.black12,
        repeat: true,
        showTwoGlows: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 0, 120, 167),
            radius: 35,
            child: Icon(
              _isListening ? Icons.stop : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          print('onStatus: $val');
        },
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;

            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Load()));
            }
          }),
        );
      }
    } else {
      setState(() {
        _isListening = false;
      });
      // final player = AudioPlayer();
      // player.play(AssetSource('assets/voice/sapaan_movielas.mp3'));
      // NotificationWidget.showNotification(
      //     title: "Movielem", body: 'Berhasil konfigurasi!');
      _speech.stop();
    }
  }
}
