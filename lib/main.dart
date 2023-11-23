import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:office_furniture_store/core/app_theme.dart';
import 'package:office_furniture_store/src/presentation/screen/intro_screen.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Enable horizontal scroll on flutter web
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
