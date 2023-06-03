import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Onboarding();
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
            SizedBox(height: 260),
            Center(
              child: Image(
                image: AssetImage('assets/images/splash/wall_splash.png'),
                height: 350.0,
                width: 350.0,
              ),
            ),
            SizedBox(height: 120),
            Center(
              child: Image(
                image: AssetImage('assets/images/splash/loading.gif'),
                height: 100.0,
                width: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
