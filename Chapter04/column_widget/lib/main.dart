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
          title: const Text("위젯 실습"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 80,
              height: 80,
              color: Colors.cyan[600],
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 90,
              height: 90,
              color: Colors.amber[600],
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 100,
              height: 100,
              color: Colors.red[600],
            ),
          ],
        ),
      ),
    );
  }
}


