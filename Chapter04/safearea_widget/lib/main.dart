import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        left: false,
        bottom: true,
        right: false,
        minimum: const EdgeInsets.all(10.0),
        child: Scaffold(
          body: Text('SafeArea Widget이 없는 경우 텍스트위치 확인',
               style: TextStyle(color: Colors.green,
             fontSize: 20)
          ),
        ),
      ),
    );
  }
}
