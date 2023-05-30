import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final inputText, fontSize, fontType;
  final fontWeight;
  final fontColor;

  CustomFont(
      {this.inputText,
      this.fontSize,
      this.fontType,
      this.fontWeight,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: TextStyle(
        fontFamily: fontType,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Colors.white,
      ),
    );
  }
}
