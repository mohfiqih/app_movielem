import 'package:app_movie/chat/chat_dewasa.dart';
import 'package:app_movie/chat/chat_remaja.dart';
import 'package:app_movie/dasbor/baca/BacaDewasa.dart';
import 'package:app_movie/dasbor/baca/BacaRemaja.dart';
import 'package:app_movie/dasbor/film_dewasa/Home_dewasa.dart';
import 'package:app_movie/dasbor/film_remaja/Home_remaja.dart';
import 'package:app_movie/history/history.dart';
import 'package:app_movie/login/login.dart';
import 'package:app_movie/settings/setting_user_dewasa.dart';
import 'package:app_movie/settings/setting_user_remaja.dart';
import 'package:flutter/material.dart';

class NavbarDewasa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomePageDewasa()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.home_filled,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("Home"),
              ],
            ),
          ),
          SizedBox(
            width: 0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BacaDewasa()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.bookmark_add_outlined,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("Baca"),
              ],
            ),
          ),
          SizedBox(
            width: 0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Chat()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.chat_outlined,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("Chat"),
              ],
            ),
          ),
          SizedBox(
            width: 0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPageDewasa()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.settings,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("Setting"),
              ],
            ),
          ),
          SizedBox(
            width: 0,
          ),
        ],
      ),
    );
  }
}
