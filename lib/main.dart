import 'package:flutter/material.dart';
import 'package:hackathon/begin/onBoarding_screen.dart';
// import 'package:hackathon/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
