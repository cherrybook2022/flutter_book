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

        // 텍스트 스타일 입히기
        // body: Text(
        //   'Flutter Text Widget',
        //   style: const TextStyle(
        //     color: Colors.orange,           // 글자 색상
        //     fontWeight: FontWeight.bold,   // 글자 굵기
        //     fontStyle: FontStyle.italic,       // 글자 스타일
        //     fontSize: 30.0,                // 글자 크기
        //   ),
        // ),

        // 글자 간격
        // body: Text(
        //   'Flutter Text Widget',
        //   style: const TextStyle(
        //     color: Colors.orange,          // 글자 색상
        //     fontWeight: FontWeight.bold,   // 글자 굵기
        //     fontStyle: FontStyle.italic,  // 글자 스타일
        //     fontSize: 30.0,               // 글자 크기
        //     letterSpacing: 10,            // 글자간격
        //   ),
        // ),

        // body: Text(
        //   'Flutter Text Widget',
        //   style: const TextStyle(
        //     color: Colors.orange,          // 글자 색상
        //     fontWeight: FontWeight.bold,   // 글자 굵기
        //     fontStyle: FontStyle.italic,  // 글자 스타일
        //     fontSize: 30.0,               // 글자 크기
        //     letterSpacing: 10,            // 글자간격
        //     // 그림자 스타일
        //     shadows:[
        //       Shadow(
        //           color:Colors.black54,   // 그림자 색상
        //           offset:Offset(1,2), // 그림자 오프셋
        //           blurRadius: 4 )   //그림자의 크기, 숫자가 커지면 그림자가 퍼집니다
        //     ],
        //     // 텍스트 꾸미기
        //     decoration: TextDecoration.underline, // underline:밑줄, lineThrough:취소선, overline : 윗줄긋기
        //     decorationColor: Colors.blueGrey,            // 라인 색상
        //     decorationStyle: TextDecorationStyle.double,  // double : 2줄, dashed : ‘-‘선, dotted : 점선,
        //                                                   // solid  : 실선, wavy : 물결선
        //   ),
        // ),

        // // 텍스트 테마
        // body: Text(
        //   'Hello! How are you?',
        //   style: Theme.of(context).textTheme.headline4,  // headline4 테마 사용
        // ),

        // 텍스트 정렬 방향
        // body: Text(
        //   'Flutter Text Widget Example of Text Direction',
        //   textDirection:TextDirection.rtl,   // 오른쪽에서 왼쪽으로 정렬
        //   style: const TextStyle(
        //     color: Colors.orange,          // 글자 색상
        //     fontWeight: FontWeight.bold,   // 글자 굵기
        //     fontStyle: FontStyle.italic,  // 글자 스타일
        //     fontSize: 24.0,               // 글자 크기
        //     letterSpacing: 2,            // 글자간격
        //     // 그림자 스타일
        //     shadows:[
        //       Shadow(
        //           color:Colors.black54,   // 그림자 색상
        //           offset:Offset(1,2), // 그림자 오프셋
        //           blurRadius: 4 )   //그림자의 크기, 숫자가 커지면 그림자가 퍼집니다
        //     ],
        //   ),
        // ),

        // OverFlow되는 텍스트
        // body: Text(
        //   '텍스트 위젯의 overflow를 학습하고 있습니다',
        //   maxLines:1,                    // 한줄만 표시
        //   overflow: TextOverflow.ellipsis,  // 문자열이 maxLines보다 긴 경우 ‘…’으로 표시
        //   style: const TextStyle(
        //     color: Colors.orange,          // 글자 색상
        //     fontWeight: FontWeight.bold,   // 글자 굵기
        //     fontStyle: FontStyle.italic,  // 글자 스타일
        //     fontSize: 24.0,               // 글자 크기
        //     letterSpacing: 2,            // 글자간격
        //     // 그림자 스타일
        //     shadows:[
        //       Shadow(
        //           color:Colors.black54,   // 그림자 색상
        //           offset:Offset(1,2), // 그림자 오프셋
        //           blurRadius: 4 )   //그림자의 크기, 숫자가 커지면 그림자가 퍼집니다
        //     ],
        //   ),
        // ),
        // 고급 텍스트 스타일
        // body: Text.rich(
        // TextSpan(
        //     text:'How ',
        //     style: Theme.of(context).textTheme.headline4,
        //     children: <TextSpan> [
        //       TextSpan(text:'are ', style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic,color : Colors.orange,),),
        //       TextSpan(text:'you?', style: TextStyle(fontSize : 30, fontWeight: FontWeight.bold, color: Colors.green),),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
