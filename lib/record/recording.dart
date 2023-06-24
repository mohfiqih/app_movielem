import 'dart:convert';
import 'dart:io';

import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/dasbor/film_anak/Home_anak.dart';
import 'package:app_movie/dasbor/film_dewasa/Home_dewasa.dart';
import 'package:app_movie/dasbor/film_remaja/Home_remaja.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/opsi/opsi.dart';
import 'package:app_movie/splash/recording/SplashKonfigurasi%20Remaja.dart';
import 'package:app_movie/splash/recording/SplashKonfigurasiAnak.dart';
import 'package:app_movie/splash/recording/SplashKonfigurasiDewasa.dart';
import 'package:app_movie/splash/recording/SuccessAnak.dart';
import 'package:app_movie/splash/recording/SuccessDewasa.dart';
import 'package:app_movie/splash/recording/SuccessRemaja.dart';
import 'package:app_movie/welcome/welcome.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:uuid/uuid.dart';

class Recording extends StatefulWidget {
  @override
  _RecordingState createState() => _RecordingState();
}

class _RecordingState extends State<Recording> with TickerProviderStateMixin {
  bool isRecording = false;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  String _status = '';
  double _confidence = 1.0;

  FlutterSoundRecorder? _recorder;
  bool _isRecording = false;
  bool _isstop = false;
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
  }

  @override
  void dispose() {
    _recorder?.closeAudioSession();
    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      await _recorder?.openAudioSession();
      setState(() {
        _isRecording = true;
      });

      final tempDir = await getTemporaryDirectory();
      final uuid = Uuid();
      final fileName = '${uuid.v4()}.wav';
      final filePath = '${tempDir.path}/$fileName';

      await _recorder?.startRecorder(
        toFile: filePath,
        codec: Codec.pcm16WAV,
      );

      setState(() {
        _filePath = filePath;
      });
    } catch (e) {
      print('Terjadi kesalahan saat memulai rekaman audio: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorder?.stopRecorder();
      setState(() {
        _isRecording = false;
      });
      final file = File(_filePath);
      EasyLoading.showSuccess(
        "Success!",
        duration: Duration(seconds: 1),
      );
      await _sendAudioToAPI(file);
    } catch (e) {
      print('Terjadi kesalahan saat menghentikan rekaman audio: $e');
    }
  }

  Future<void> _sendAudioToAPI(File audioFile) async {
    try {
      final url = Uri.parse('http://192.168.30.106:5000/save-audio');
      final request = http.MultipartRequest('POST', url);
      request.files
          .add(await http.MultipartFile.fromPath('audio', audioFile.path));
      final response = await request.send();

      if (response.statusCode == 200) {
        final jsonString = await response.stream.bytesToString();
        final json = jsonDecode(jsonString);
        print(json);
        var label = json['label'];
        if (label == 'Dewasa') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SplashKonfigurasiDewasa()));
        } else if (label == 'Remaja') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SplashKonfigurasiRemaja()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SplashKonfigurasiAnak()));
        }
      } else {
        print('Gagal mengirim audio ke API. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengirim audio ke API: $e');
    }
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
                        MaterialPageRoute(builder: (context) => Opsi()));
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
                height: 30,
              ),
              Center(
                child: Text(
                    'Ucapkan kalimat dibawah ini \n "Hallo Saya sangat senang menikmati aplikasi ini"',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 120,
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
              SizedBox(
                height: 70,
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
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              if (_isRecording)
                Text(
                  'Recording audio..',
                  style: TextStyle(fontSize: 17),
                ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 90,
        animate: _isRecording,
        duration: Duration(milliseconds: 2000),
        glowColor: Colors.black38,
        repeat: true,
        showTwoGlows: true,
        child: FloatingActionButton(
          onPressed: _isRecording ? _stopRecording : _startRecording,
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 0, 120, 167),
            radius: 35,
            child: Icon(
              _isRecording ? Icons.stop : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
