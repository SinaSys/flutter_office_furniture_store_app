import 'dart:ui' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_theme.dart';
import 'package:office_furniture_store/src/view/screen/intro_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      home: const IntroScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
