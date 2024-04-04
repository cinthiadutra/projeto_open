import 'package:flutter/material.dart';

class AppConfigUi {
  AppConfigUi._();

  ///constructor private
  ///
  static final ThemeData themeData = ThemeData(

      primaryColor: const Color.fromARGB(255, 1, 100, 36),
      primaryColorLight: const Color.fromARGB(255, 4, 144, 123),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          labelStyle: TextStyle(color: Colors.black)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))));
}
