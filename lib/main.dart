import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/../core/app_theme.dart';
import 'src/business_logic/provider/furniture_provider.dart';
import 'src/data/repository/repository.dart';
import 'src/presentation/screen/intro_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          Provider<Repository>(create: (context) => Repository()),
          ChangeNotifierProvider<FurnitureProvider>(
            create: (context) => FurnitureProvider(
              repository: context.read<Repository>(),
            ),
          )
        ],
        child: const IntroScreen(),
      ),
      theme: AppTheme.lightTheme,
    );
  }
}
