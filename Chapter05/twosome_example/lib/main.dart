import 'package:flutter/material.dart';
import 'package:twosome_example/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twosome Clone',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(), // 홈 화면을 보여줌
    );
  }
}

