import 'dart:convert';
import 'dart:async';
import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/dasbor/film_anak/Home_anak.dart';
import 'package:app_movie/dasbor/notif.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_tts/flutter_tts.dart';

class ChatAnak extends StatefulWidget {
  const ChatAnak({Key? key}) : super(key: key);

  @override
  State<ChatAnak> createState() => _ChatAnakState();
}

class _ChatAnakState extends State<ChatAnak> {
  FlutterTts flutterTts = FlutterTts();
  final List<Message> _msg = <Message>[];
  final TextEditingController _txtController = TextEditingController();

  Future<void> convertTextToAudio(String _msg) async {
    // await flutterTts.setLanguage('en-US');
    await flutterTts.setLanguage('id-ID');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(_msg);
  }

  void getChatbotReply(String userReply) async {
    _txtController.clear();

    var response =
        await http.get(Uri.parse(ip_universal + "get?msg=[$userReply]"));

    var data = (response.body);
    var botReply = data;

    Message msg = Message(
      text: botReply,
      name: "Mibot",
      type: false,
    );

    setState(() {
      _msg.insert(0, msg);
      convertTextToAudio(botReply);
      NotificationWidget.showNotification(
          title: "Mibot 🤪", body: '$botReply🫠');
    });
  }

  void initState() {
    super.initState();
    NotificationWidget.init();
    playSound();
  }

  void handleSubmitted(text) async {
    if (kDebugMode) {
      print(text);
    }
    _txtController.clear();
    Message msg = Message(
      text: text,
      name: "",
      type: true,
      //date: DateTime.now(),
    );
    setState(() {
      _msg.insert(0, msg);
    });
    getChatbotReply(text);
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  late AudioPlayer audioPlayer;

  String audioPath = 'assets/voice/MibotFemale.mp3';

  void playSound() async {
    audioPlayer = AudioPlayer();
    await audioPlayer.setAsset(audioPath);
    await audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.lightBlue,
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/wallpaper.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomePageAnak()));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 75, top: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              "Mibot",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                            SizedBox(width: 15),
                            GestureDetector(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/images/mibot.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 179, 179, 179),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(
                //   width: 1,
                // ),
                color: Colors.white,
              ),
              height: 70,
            ),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                reverse: true,
                itemBuilder: (_, int index) => _msg[index],
                itemCount: _msg.length,
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).cardColor),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  child: Container(
                    height: 125,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    color: Color.fromARGB(255, 247, 247, 247),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextField(
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                controller: _txtController,
                                onSubmitted: handleSubmitted,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Silahkan tanya pada mibot..',
                                  suffixIcon: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: IconButton(
                                      icon: const Icon(Icons.send),
                                      onPressed: () =>
                                          handleSubmitted(_txtController.text),
                                      color: Color.fromARGB(255, 21, 21, 21),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;
  final String name;
  final bool type;

  const Message({
    required this.text,
    required this.name,
    required this.type,
    //  required this.date,
  });

  List<Widget> bot(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 209, 236, 255),
          child: Text(
            'Bot',
            textAlign: TextAlign.justify,
            style: (TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 74, 126),
            )),
          ),
        ),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(text, style: const TextStyle(fontSize: 16.0)),
          )
        ],
      ))
    ];
  }

  List<Widget> me(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // padding: const EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //   color: Color.fromARGB(255, 246, 246, 246),
              //   border: Border.all(color: Color.fromARGB(255, 235, 235, 235)),
              //   borderRadius: BorderRadius.circular(12),
              // ),
              margin: const EdgeInsets.only(top: 0),
              child: Text(text, style: const TextStyle(fontSize: 16.0)),
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 0, 120, 167),
          child: Text(
            'Me',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: type ? me(context) : bot(context),
      ),
    );
  }
}
