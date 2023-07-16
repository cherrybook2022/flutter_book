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
        ),

        body:
         // 컨테이너 margin & padding 속성
         Container(
            color: Colors.yellow,         // 컨테이너 색상
            margin: EdgeInsets.all(30),   // 바깥쪽 여백
            padding: EdgeInsets.all(50),  // 안쪽 여백, EdgeInsets의 옵션을 변경하면서 테스트합니다.
            child: Container (            // 하위 위젯으로 컨테이너를 생성
              color: Colors.orangeAccent,
            ),
          ),

        // 테두리
        // Container(
        //   margin: EdgeInsets.all(30),
        //   decoration: BoxDecoration (
        //    border: Border.all (
        //      color:Colors.green,
        //      width: 10,
        //      style : BorderStyle.solid,
        //      strokeAlign: StrokeAlign.inside
        //    ),
        //   ),
        // )

        // 둥근모서리
        // Container(
        //   margin: EdgeInsets.all(30),
        //   decoration: BoxDecoration (
        //     border: Border.all (
        //       color:Colors.green,
        //       width: 10,
        //       style : BorderStyle.solid,
        //       strokeAlign: StrokeAlign.inside
        //     ),
        //     borderRadius: BorderRadius.all(  // 모서리 전부를 둥글게 만듬
        //         Radius.circular(40),         // 모서리를 둥글게 하는 정도를 설정
        //     ),
        //   ),
        // )

        // 둥근모서리 효과
        // Container(
        //   margin: EdgeInsets.all(30),
        //   decoration: BoxDecoration (
        //     border: Border.all (
        //       color:Colors.green,
        //       width: 10,
        //       style : BorderStyle.solid,
        //       strokeAlign: StrokeAlign.inside
        //     ),
        //     borderRadius: BorderRadius.only(
        //       topRight : Radius.circular(100),
        //       bottomLeft:Radius.circular(100),
        //     ),
        //   ),
        // )

        // 그라데이션 효과
        // Container(
        //   margin: EdgeInsets.all(30),
        //   decoration: BoxDecoration (
        //     border: Border.all (
        //       color:Colors.green,
        //       width: 2,
        //       style : BorderStyle.solid,
        //       strokeAlign: StrokeAlign.inside
        //     ),
        //     borderRadius: BorderRadius.all(  // 모서리 전부를 둥글게 만듬
        //         Radius.circular(40),         // 모서리를 둥글게 하는 정도를 설정
        //     ),
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,         // 그라데이션 시작 위치 : 왼쪽 위
        //       end: Alignment.bottomRight,     // 그라데이터 끝 위치 : 오른쪽 아래
        //       colors:[Colors.purpleAccent, Colors.white], // 그라데이터 시작색상과 끝 색상 지정
        //     ),
        //   ),
        // )

        // 그림자 효과
        // Container(
        //   margin: EdgeInsets.all(30),
        //   decoration: BoxDecoration (
        //     border: Border.all (
        //       color:Colors.green,
        //       width: 2,
        //       style : BorderStyle.solid,
        //       strokeAlign: StrokeAlign.inside
        //     ),
        //     borderRadius: BorderRadius.only(
        //       topRight : Radius.circular(100),
        //       bottomLeft:Radius.circular(100),
        //     ), // 오른쪽 상단과 왼쪽 하단을 둥글게 모서리 만듬
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,         // 그라데이션 시작 위치 : 왼쪽 위
        //       end: Alignment.bottomRight,       // 그라데이터 끝 위치 : 오른쪽 아래
        //       colors:[Colors.purpleAccent, Colors.white], // 그라데이터 시작색상과 끝 색상 지정
        //     ),
        //     boxShadow: [
        //       BoxShadow(color:Colors.grey,    // 그림자 색상
        //           spreadRadius: 4.0,           // 그림자가 퍼지는 정도
        //           blurRadius: 10.0,            // 그림자 흐리기의 정도
        //           blurStyle: BlurStyle.outer), // 그림자 스타일
        //     ],
        //   ),
      ),
    );
  }
}


// 컨테이너 margin & padding 속성
// Container(
//  color: Colors.yellow,         // 컨테이너 색상
//  margin: EdgeInsets.all(30),   // 바깥쪽 여백
//  padding: EdgeInsets.all(50),  // 안쪽 여백, EdgeInsets의 옵션을 변경하면서 테스트합니다.
//  child: Container (            // 하위 위젯으로 컨테이너를 생성
//   color: Colors.orangeAccent,
//  ),
// )


// 테두리 border
// body: Container(
//  margin: EdgeInsets.all(30),
//  decoration: BoxDecoration (
//    // 테두리 꾸미기
//    border: Border.all (
//    color:Colors.green,
//    width: 10,
//    style : BorderStyle.solid,
//    strokeAlign: StrokeAlign.inside
//  ),
// ),
// )



// 테두리 border
// Container(
//   color: Colors.yellow,         // 컨테이너 색상
//   margin: EdgeInsets.all(30),   // 바깥쪽 여백
//   padding: EdgeInsets.all(50),  // 안쪽 여백, EdgeInsets의 옵션을 변경하면서 테스트합니다.
//   child: Container (            // 하위 위젯으로 컨테이너를 생성
//     color: Colors.orangeAccent,
//   ),
// )
