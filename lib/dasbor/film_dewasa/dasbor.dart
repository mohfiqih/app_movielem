import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:movie_app/HomePage.dart';
// import 'package:movie_app/pages/CategoryPage.dart';
// import 'package:movie_app/pages/MoviePage.dart';

void main() {
  runApp(Dasbor());
}

class Dasbor extends StatefulWidget {
  @override
  State<Dasbor> createState() => _DasborState();
}

class _DasborState extends State<Dasbor> {
  @override
  void initState() {
    // To hide status bar and below buttons
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEEEEEE),
      ),
      // routes: {
      //   "/": (context) => HomePage(),
      //   "categoryPage": (context) => categoryPage(),
      //   "moviePage1": (context) => MoviePage1(),
      //   "moviePage2": (context) => MoviePage2(),
      //   "moviePage3": (context) => MoviePage3(),
      //   "moviePage4": (context) => MoviePage4(),
      //   // "moviePage5": (context) => MoviePage5(),
      //   // "moviePage6": (context) => MoviePage6(),
      // },
    );
  }
}
