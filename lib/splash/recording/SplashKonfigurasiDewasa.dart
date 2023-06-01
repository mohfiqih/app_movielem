import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/splash/recording/SuccessDewasa.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class SplashKonfigurasiDewasa extends StatefulWidget {
  @override
  State<SplashKonfigurasiDewasa> createState() => _SplashKonfigurasiDewasa();
}

class _SplashKonfigurasiDewasa extends State<SplashKonfigurasiDewasa> {
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
          return SuccessDewasa();
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
            SizedBox(height: 350),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 10,
                  child: SvgPicture.asset(
                    "assets/images/splash/tunggu.svg",
                    height: 150,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Sedang mengkonfigurasi suara anda",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 180),
            Center(
              child: Image(
                image: AssetImage('assets/images/splash/loading.gif'),
                height: 120.0,
                width: 120.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
