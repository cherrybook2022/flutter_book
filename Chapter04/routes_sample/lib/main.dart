import 'package:flutter/material.dart';
import 'package:routes_sample/home_page.dart';
import 'package:routes_sample/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes Sample',
      initialRoute: '/home',      // 초기화면 지정
      routes: {
        '/home'       : (context) => MyHomePage(), // MyHomePage로 이동
        '/second_page': (context) => SecondPage(), // SecondPage로 이동
      }
    );
  }
}
