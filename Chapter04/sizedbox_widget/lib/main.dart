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
          title: Text('위젯 실습'),
        ),  // AppBar
        body: Center(
          child: Column(
            children: <Widget> [
              Image.network('https://picsum.photos/200?image=30', // 지정된 사이즈만큼 이미지 채움
                width: 420, height: 200, fit: BoxFit.cover,),
              const SizedBox(height: 20.0,),
              Image.network('https://picsum.photos/200?image=30',  // 박스 사이즈만큰 확대
                width:420,height:220,fit: BoxFit.fill,),
              Image.network('https://picsum.photos/200?image=30',  // 원본 이미지가 온전히 보이도록.
                width:420,height:160,fit: BoxFit.contain,),
            ], // Children
          ),
        ),
      ), // Scaffold
    );  // MaterialApp
  }
}
