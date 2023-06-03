import 'dart:async';

import 'package:app_movie/admin/admin.dart';
import 'package:app_movie/admin/history/data/data_admin.dart';
import 'package:app_movie/admin/history/history.dart';
import 'package:app_movie/admin/history/skip_/model/model_admin.dart';
import 'package:app_movie/audio/audio.dart';
import 'package:app_movie/camera/camera.dart';
import 'package:app_movie/dasbor/film_dewasa/Home_dewasa.dart';
import 'package:app_movie/dasbor/film_anak/Home_anak.dart';
import 'package:app_movie/dasbor/film_remaja/Home_remaja.dart';
import 'package:app_movie/dasbor/notif.dart';
import 'package:app_movie/opsi/opsi.dart';
import 'package:app_movie/otp/otp.dart';
import 'package:app_movie/record/recording.dart';
import 'package:app_movie/record/rekam.dart';
import 'package:app_movie/settings/setting_user_dewasa.dart';
import 'package:app_movie/splash/load.dart';
import 'package:app_movie/splash/onGoing.dart';
import 'package:app_movie/otp/skip_/otp_phone/otp_phone.dart';
import 'package:app_movie/otp/skip_/otp_phone/phone.dart';
import 'package:app_movie/record/record.dart';
import 'package:app_movie/register/register.dart';
import 'package:app_movie/splash/wait.dart';
import 'package:app_movie/welcome/welcome.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:app_movie/onboarding/constant/constants.dart';
import 'package:app_movie/onboarding/model/slider.dart';
import 'package:app_movie/onboarding/widget/slide_dots.dart';
import 'package:app_movie/onboarding/widget/slide_item.dart';

import 'package:flutter/services.dart';

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
    NotificationWidget.init();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  // AudioPlayer audioPlayer = AudioPlayer();

  // String url = 'assets/voice/sapaan_movielas.mp3';
  // void playSound(url) async {
  //   await audioPlayer.play(url);
  // }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() => Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: sliderArrayList.length,
                itemBuilder: (ctx, i) => SlideItem(i),
              ),
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 18),
                    child: GestureDetector(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 120, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      onTap: () async {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Welcome(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 18),
                    child: GestureDetector(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 120, 167),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      onTap: () {
                        _onPageChanged;
                      },
                    ),
                  ),
                  // Align(),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, "YourRoute");
                  //   },
                  //   child: Padding(
                  //     padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                  //     child: Text(
                  //       Constants.REGISTER,
                  //       style: TextStyle(
                  //         fontFamily: Constants.OPEN_SANS,
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 14.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Align(
                  //   alignment: Alignment.bottomLeft,
                  //   child: Padding(
                  //     // TextButton(),
                  //     padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                  //     child: Text(
                  //       Constants.REGISTER,
                  //       style: TextStyle(
                  //         fontFamily: Constants.OPEN_SANS,
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 14.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: Padding(
                  //     padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                  //     child: Text(
                  //       Constants.NEXT,
                  //       style: TextStyle(
                  //         fontFamily: Constants.OPEN_SANS,
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 14.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < sliderArrayList.length; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
