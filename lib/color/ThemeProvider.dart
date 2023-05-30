import 'package:flutter/material.dart';

class ThemeProvider extends StatelessWidget {
  final ThemeMode themeMode;
  final Widget child;

  const ThemeProvider({Key? key, required this.themeMode, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: child,
    );
  }
}
