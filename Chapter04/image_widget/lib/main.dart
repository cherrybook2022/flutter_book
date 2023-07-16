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
        // body:  Text('body 영역인 이곳에 예제 소스를 작성합니다'),
        // 네트워크 이미지 View
        body: Image.network(
            'https://picsum.photos/300?image=24',
        ),

        // 로컬 이미지 로드
        // body: const Image(
        //   image: AssetImage('assets/house.png'),
        //   width: 200,    // 폭
        //   height: 400,   // 높이
        //   fit: BoxFit.cover, // BoxFit.fill, BoxFit.contain, BoxFit.none, BoxFit.fitHeight, BoxFit.fitWidth
        // ),


      ),
    );
  }
}