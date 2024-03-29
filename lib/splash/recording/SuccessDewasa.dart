import 'package:app_movie/dasbor/film_dewasa/Home_dewasa.dart';
import 'package:app_movie/dasbor/notif.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessDewasa extends StatefulWidget {
  @override
  State<SuccessDewasa> createState() => _SuccessDewasa();
}

class _SuccessDewasa extends State<SuccessDewasa> {
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
          return HomePageDewasa();
        }),
      );
      NotificationWidget.showNotification(
          title: "Movielem 😉", body: 'Anda ternyata dewasa! 🤪');
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
                    "assets/images/splash/complete.svg",
                    height: 200,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Complete!",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
