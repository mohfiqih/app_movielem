import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/record/record.dart';
import 'package:app_movie/record/recording.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class onGoing extends StatefulWidget {
  @override
  State<onGoing> createState() => _onGoing();
}

class _onGoing extends State<onGoing> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 7);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Recording();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Center(
              child: Image(
                image: AssetImage('assets/images/splash/onGoing.gif'),
                height: 500.0,
                width: 500.0,
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Image(
                image: AssetImage('assets/images/splash/loading.gif'),
                height: 100.0,
                width: 100.0,
              ),
            ),
            // Text(
            //   "Mohon tunggu sebentar ya..",
            //   style: TextStyle(fontSize: 16),
            // )
          ],
        ),
      ),
    );
  }
}
