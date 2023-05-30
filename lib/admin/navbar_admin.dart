import 'package:app_movie/admin/analisis/analisis.dart';
import 'package:app_movie/admin/admin.dart';
import 'package:app_movie/admin/chart/chart.dart';
import 'package:app_movie/admin/history/history.dart';
import 'package:app_movie/chat/chat_dewasa.dart';
import 'package:app_movie/history/history.dart';
import 'package:app_movie/login/login.dart';
import 'package:flutter/material.dart';

class NavbarAdmin extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => HalamanAdmin()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.home,
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MenuHistory()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.bookmark_add_outlined,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
                Text("History"),
              ],
            ),
          ),
          SizedBox(
            width: 0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Analisis()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.analytics_outlined,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
                Text("Analisis"),
              ],
            ),
          ),
          SizedBox(
            width: 0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Chart()));
            },
            child: Column(
              children: [
                Icon(
                  Icons.align_vertical_bottom_outlined,
                  size: 28,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
                Text("Chart"),
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
