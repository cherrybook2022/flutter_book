import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.yellow[200],
        // 텍스트 버튼
        body: TextButton(
          onPressed: () { }, // 동작방식을 입력합니다.

          child: Text(
            '텍스트 버튼',
          ),
        ),
        // body: Center(
        //   child: TextButton.icon(
        //     icon: const Icon(
        //       Icons.add,
        //       size: 20,
        //       color: Colors.purple,
        //     ),
        //     label: Text(
        //       '아이콘 버튼',
        //       style: TextStyle(fontSize: 30, color: Colors.purple),
        //     ),
        //     onPressed: () {
        //       // 동작방식을 입력합니다.
        //     },
        //   ),
        // ),

        // ElevatedButton
        // body: Center(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: <Widget>[
        //       ElevatedButton(                     // 비활성화된 Elevated Button
        //         onPressed: null,                   // onPressed 속성에 null인 경우 비활성화됨
        //         child: const Text('비활성화'),
        //       ),
        //       const SizedBox(height: 30),
        //       ElevatedButton(                    // 활성화된 Elevated Button
        //         onPressed: () {print('Pressed');},    // 클릭스 log에 'Pressed'로 출력
        //         child: const Text('활성화'),
        //       ),
        //     ],
        //   ),
        // ),

        // body: Center(
        //   child: ElevatedButton (
        //     child: Text ('Next', style: GoogleFonts.acme(fontSize: 30, color: Colors.black87)),
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.amberAccent,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(9)),
        //         elevation: 5
        //     ),
        //     onPressed: ()  {},
        //   ),
        // ),

        // 아웃라인 버튼
        // body: Center(
        //   child: OutlinedButton(
        //     onPressed: () {
        //       print('버튼 클릭');
        //     },
        //     child: const Text('아웃라인 버튼'),
        //     style: OutlinedButton.styleFrom(
        //       backgroundColor: Colors.deepOrange,    // 배경색
        //       foregroundColor: Colors.white,         // 글자색
        //       shape:const RoundedRectangleBorder(    // 둥근모서리
        //           borderRadius: BorderRadius.all(Radius.circular(10))),
        //     ),
        //   ),
        // ),

        // 플러팅버튼
        // body: const Center(
        //     child: Text('아래 버튼을 누르세요!')
        // ), // body
        // // body 아래에 작성합니다.
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // 동작방식을 입력합니다.
        //   },
        //   backgroundColor: Colors.red,
        //   child: const Icon(
        //     Icons.favorite,       // 아이콘
        //     color: Colors.white,
        //   ), // icon
        // ),
      ),
    );
  }
}


// TextButton
// body: Center(
//   child: TextButton.icon(
//     icon: const Icon(
//       Icons.add,
//       size: 20,
//       color: Colors.purple,
//     ),
//     label: Text(
//       '아이콘 버튼',
//       style: TextStyle(fontSize: 30, color: Colors.purple),
//     ),
//     onPressed: () {
//     // 동작방식을 입력합니다.
//     },
//   ),
// ),

//ElevatedButton
// body: Center(
//   child: Column(
//     mainAxisSize: MainAxisSize.min,
//     children: <Widget>[
//       ElevatedButton(                     // 비활성화된 Elevated Button
//         onPressed: null,                  // onPressed 속성에 null인 경우 비활성화됨
//         child: const Text('비활성화'),
//       ),
//       const SizedBox(height: 30),
//       ElevatedButton(                      // 활성화된 Elevated Button
//         onPressed: () {print('Pressed');}, // 클릭스 log에 'Pressed'로 출력
//         child: const Text('활성화'),
//       ),
//     ],
//   ),
// ),

// 아웃라인버튼
// body: Center(
//   child: OutlinedButton(
//     onPressed: () {
//       print('버튼 클릭');
//     },
//     child: const Text('아웃라인 버튼'),
//       style: OutlinedButton.styleFrom(
//       backgroundColor: Colors.deepOrange,    // 배경색
//       foregroundColor: Colors.white,         // 글자색
//       shape:const RoundedRectangleBorder(    // 둥근모서리
//       borderRadius: BorderRadius.all(Radius.circular(10))),
//     ),
//   ),
// ),

