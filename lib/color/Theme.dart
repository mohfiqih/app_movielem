import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

enum ThemeModeOptions {
  light,
  dark,
  system,
}

class ThemeModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void updateTheme(ThemeModeOptions themeModeOption) {
    switch (themeModeOption) {
      case ThemeModeOptions.light:
        _themeMode = ThemeMode.light;
        break;
      case ThemeModeOptions.dark:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeModeOptions.system:
        _themeMode = ThemeMode.system;
        break;
    }
    notifyListeners();
  }
}
