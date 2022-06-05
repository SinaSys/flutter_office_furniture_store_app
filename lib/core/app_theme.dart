import 'package:flutter/material.dart';

class AppTheme{
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    )
 );
}