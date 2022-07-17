import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_furniture_store/core/app_theme.dart';
import 'package:office_furniture_store/src/business_logic/bloc/furniture/furniture_bloc.dart';
import 'package:office_furniture_store/src/data/repository/repository.dart';
import 'package:office_furniture_store/src/presentation/screen/intro_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Repository>(
      create: (context) => Repository(),
      child: BlocProvider<FurnitureBloc>(
        create: (context) =>
            FurnitureBloc(repository: context.read<Repository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const IntroScreen(),
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
