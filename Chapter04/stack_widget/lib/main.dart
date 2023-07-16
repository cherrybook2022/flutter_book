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
        body: Stack(
          children: <Widget>[
            Container(
              width: 400,
              height: 500,
              color: Colors.yellowAccent,
            ),
            Container(
              width: 300,
              height: 400,
              color: Colors.amber[600],
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.red[600],
            ),
            Text(
              'Stack',
              style: TextStyle(color: Colors.white, fontSize:40),
            ),
          ], // Children
        ),
      ),
    );
  }
}


