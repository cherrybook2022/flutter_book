import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('위젯 실습'),
        ),  // AppBar
        body:  Text('body 영역인 이곳에 예제 소스를 작성합니다'),
      ),  // Scaffold
    );  // MaterialApp
  }
}
