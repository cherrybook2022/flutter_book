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
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.amberAccent,
            width: 120.0,
            height: 120.0,
          ), // Container
        ),

      ),  // Scaffold
    );  // MaterialApp
  }
}
