import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_furniture_store/core/app_theme.dart';
import 'package:office_furniture_store/src/bloc/furniture_bloc.dart';
import 'package:office_furniture_store/src/view/screen/intro_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FurnitureBloc>(
      create: (context) => FurnitureBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroScreen(),
        theme: AppTheme.lightTheme,
      ),
    );
  }
}

