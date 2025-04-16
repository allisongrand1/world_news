import 'package:flutter/material.dart';

enum AppThemeType { light, dark }

class AppTheme {
  static ThemeData createTheme(AppThemeType themeType) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: themeType == AppThemeType.light ? Brightness.light : Brightness.dark,
      ),
      useMaterial3: true,
    );
  }
}
