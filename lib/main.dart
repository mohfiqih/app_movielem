import 'dart:io';

import 'package:app_movie/color/ThemeProvider.dart';
import 'package:app_movie/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:app_movie/color/Theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movielem App',
      home: Splash(),
      builder: EasyLoading.init(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Consumer<ThemeModel>(
  //     builder: (context, themeModel, _) => ThemeProvider(
  //       themeMode: themeModel.themeMode,
  //       child: MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         themeMode: ThemeMode.system,
  //         darkTheme: ThemeData.dark(),
  //         theme: ThemeData.light(),
  //         title: 'Movielem',
  //         home: Splash(),
  //         builder: EasyLoading.init(),
  //       ),
  //     ),
  //   );
  // }
}
