import 'package:flutter/material.dart';
import 'package:news_test_app/constants/font_names.dart';
import 'package:news_test_app/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontNames.sfUIDisplay,
        scaffoldBackgroundColor: const Color.fromRGBO(229, 229, 229, 1),
      ),
      home: const HomeScreenView(),
    );
  }
}