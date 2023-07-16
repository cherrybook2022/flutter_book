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
        body: Container (
          margin: EdgeInsets.all(150),
          child:  Icon(
            Icons.forest,         // 아이콘
            size: 50,             // 아이콘 사이즈
            color: Colors.green,   // 아이콘 색상
          ),
        )

      ),  // Scaffold
    );  // MaterialApp
  }
}
