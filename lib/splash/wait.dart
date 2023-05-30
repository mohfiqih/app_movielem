import 'package:app_movie/dasbor/film_dewasa/dasbor.dart';
import 'package:app_movie/dasbor/notif.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/splash/complete.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class Wait extends StatefulWidget {
  @override
  State<Wait> createState() => _Wait();
}

class _Wait extends State<Wait> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Onboarding();
        }),
      );
      NotificationWidget.showNotification(
          title: "Movielem 😉", body: 'Berhasil Logout!👌');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 350),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 10,
                  child: SvgPicture.asset(
                    "assets/images/splash/seeu.svg",
                    height: 200,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "See you next time!",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 140),
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
