import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white, backgroundColor: Colors.transparent),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, background: backgroundColor),
        useMaterial3: true,
      ),
      home: ScreenMainPage(),
    );
  }
}
