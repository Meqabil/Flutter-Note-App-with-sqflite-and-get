import 'package:flutter/material.dart';
class AppThemes {
  static final lightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
          color: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          )
      )
  );

  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF424242)),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  );
}