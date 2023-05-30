import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/onboarding/constant/constants.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  // final String color;

  Slider({
    required this.sliderImageUrl,
    required this.sliderHeading,
    required this.sliderSubHeading,
    // required MaterialColor color,
  });
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/onboarding/on1.png',
      sliderHeading: Constants.SLIDER_HEADING_1,
      sliderSubHeading: Constants.SLIDER_DESC),
  Slider(
      sliderImageUrl: 'assets/images/onboarding/on2.png',
      sliderHeading: Constants.SLIDER_HEADING_2,
      sliderSubHeading: Constants.SLIDER_DESC),
  Slider(
      sliderImageUrl: 'assets/images/onboarding/on3.png',
      sliderHeading: Constants.SLIDER_HEADING_3,
      sliderSubHeading: Constants.SLIDER_DESC),
];
