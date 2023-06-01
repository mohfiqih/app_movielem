import 'package:app_movie/chat/chat_dewasa.dart';
import 'package:app_movie/chat/chat_remaja.dart';
import 'package:app_movie/dasbor/film_remaja/Home_remaja.dart';
import 'package:app_movie/history/history.dart';
import 'package:app_movie/login/login.dart';
import 'package:flutter/material.dart';

class NavbarRemaja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  MaterialPageRoute(builder: (context) => HomePageRemaja()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.home_filled,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
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
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => Chat()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.filter_drama,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
                Text("Film"),
              ],
            ),
          ),
          SizedBox(
            width: 0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ChatRemaja()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.chat_outlined,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
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
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => Chart()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.settings,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
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
