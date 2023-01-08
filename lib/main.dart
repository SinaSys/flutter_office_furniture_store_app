import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/data/repository/repository.dart';
import 'src/presentation/screen/intro_screen.dart';
import 'src/business_logic/cubit/furniture/furniture_cubit.dart';

import 'core/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Repository>(
      create: (context) => Repository(),
      child: BlocProvider<FurnitureCubit>(
        create: (context) =>
            FurnitureCubit(repository: context.read<Repository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const IntroScreen(),
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
