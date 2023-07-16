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

        // Expaned widget 적용
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 100,
                height: 100,
                color: Colors.cyan[600],
              ),
            ), // 첫번째 컨테이너
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 100,
                height: 100,
                color: Colors.amber[600],
              ),
            ), // 두번째 컨테이나
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 100,
              height: 100,
              color: Colors.red[600],
            ), // 세번째 컨테이너
          ], // children
        ),

      // flex 속성 적용
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: <Widget>[
      //     Expanded(
      //       flex: 1,
      //       child: Container(
      //         margin: const EdgeInsets.all(10.0),
      //         width: 100,
      //         height: 100,
      //         color: Colors.cyan[600],
      //       ),
      //     ), // 첫번째 컨테이너
      //     Expanded(
      //       flex: 2,
      //       child: Container(
      //         margin: const EdgeInsets.all(10.0),
      //         width: 100,
      //         height: 100,
      //         color: Colors.amber[600],
      //       ),
      //     ), // 두번째 컨테이나
      //     Expanded(
      //       flex: 3,
      //       child: Container(
      //         margin: const EdgeInsets.all(10.0),
      //         width: 100,
      //         height: 100,
      //         color: Colors.red[600],
      //       ),
      //     ), // 세번째 컨테이너
      //   ],
      //  ),
      ),
    );
  }
}
