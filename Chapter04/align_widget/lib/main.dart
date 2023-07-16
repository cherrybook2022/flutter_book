import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(
          title: Text('Widget Example'),
        ),  // AppBar
        body: Center(
          child: Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: const Align(
              alignment: Alignment.topRight, //Flutter로고를 컨테이너의 오른쪽 위쪽모서리에 정렬
              child: FlutterLogo(
                size: 60,
              ), // FlutterLogo
            ), // Align
          ),
        ),
      ), // Scaffold
    );  // MaterialApp
  }
}
