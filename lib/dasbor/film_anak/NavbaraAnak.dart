import 'package:app_movie/chat/chat_anak.dart.dart';
import 'package:app_movie/chat/chat_dewasa.dart';
import 'package:app_movie/dasbor/baca/BacaAnak.dart';
import 'package:app_movie/dasbor/film_anak/Home_anak.dart';
import 'package:app_movie/history/history.dart';
import 'package:app_movie/login/login.dart';
import 'package:app_movie/settings/setting_user_anak.dart';
import 'package:flutter/material.dart';

class NavbarAnak extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => HomePageAnak()));
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => BacaAnak()));
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
                  context, MaterialPageRoute(builder: (context) => ChatAnak()));
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SettingsPageAnak()));
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
