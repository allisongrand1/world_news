import 'package:flutter/material.dart';

enum AppThemeType { light, dark }

class AppTheme {
  static ThemeData createTheme(AppThemeType themeType) {
    return ThemeData(
      fontFamily: 'OpenSans',
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFf8f8f8),
      primaryColor: Colors.black,
      primarySwatch: Colors.blue,
      useMaterial3: true,

      textTheme: const TextTheme(
        headlineSmall: TextStyle(fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        titleMedium: TextStyle(fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
        bodyMedium: TextStyle(fontSize: 13, color: Colors.black54),
        labelMedium: TextStyle(fontSize: 12, color: Colors.black38),
        bodySmall: TextStyle(fontSize: 12, color: Colors.black38),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF3F1EF),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        hintStyle: const TextStyle(color: Colors.black45),
        labelStyle: const TextStyle(color: Colors.black45),
        helperStyle: const TextStyle(color: Colors.black45),
        suffixStyle: const TextStyle(color: Colors.black45),
        prefixStyle: const TextStyle(color: Colors.black45),
        floatingLabelStyle: const TextStyle(color: Colors.black45),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      cardColor: Colors.white,
      dividerColor: Colors.grey.shade200,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFFDFBF9),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        elevation: 8,
      ),
    );
  }
}
