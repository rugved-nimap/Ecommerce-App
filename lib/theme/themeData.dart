import 'package:flutter/material.dart';

class Themedata {
  ThemeData lightMode() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xfff5f5f5),
      primaryColor: Colors.grey.shade900,
      primaryColorLight: Colors.grey.shade800,
      primaryIconTheme: IconThemeData(color: Colors.grey.shade900),
      cardColor: Colors.white,
      hintColor: Colors.grey.shade700,
      primaryColorDark: Colors.grey.shade500.withOpacity(0.5)
    );
  }

  ThemeData darkMode() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.white,
      primaryColorLight: Colors.grey.shade500,
      primaryIconTheme: const IconThemeData(color: Colors.white70),
      cardColor: Colors.grey.shade900,
      hintColor: Colors.white70,
        primaryColorDark: Colors.grey.shade900
    );
  }
}
