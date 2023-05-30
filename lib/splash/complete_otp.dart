import 'package:app_movie/dasbor/film_dewasa/dasbor.dart';
import 'package:app_movie/dasbor/notif.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/record/record.dart';
import 'package:app_movie/record/recording.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class Complete_OTP extends StatefulWidget {
  @override
  State<Complete_OTP> createState() => _Complete_OTP();
}

class _Complete_OTP extends State<Complete_OTP> {
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
          return Recording();
        }),
      );
      NotificationWidget.showNotification(
          title: "Movielem 😉", body: 'Validasi OTP Berhasil!👍');
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
              "Token Success!",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
