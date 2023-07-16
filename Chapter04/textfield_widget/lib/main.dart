import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        // 이메일 형식으로만 입력
        body: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Email',                // 텍스트필드 위에 표시되는 입력된 텍스트명
            hintText: 'you@email.com',     // 입력전에 표시되는 텍스트, 주로 입력형식을 표시, 입력과 동시에 지워짐
            icon: Icon(Icons.mail_outline),    // 텍스트필드 앞에 표시되는 아이콘
          ),
        ),

        //   숫자만 입력가능한 텍스트박스
        // body: TextField(
        //   controller: TextEditingController(),
        //   keyboardType: TextInputType.number,    // 키보드타입 : 숫자
        //   decoration: InputDecoration(
        //     labelText: 'Number',                  // 텍스트필드 위에 표시되는 입력된 텍스트명
        //     hintText: '12345',                     // 입력전에 표시되는 텍스트
        //     icon: Icon(Icons.calculate_outlined),    // 텍스트필드 앞에 표시되는 아이콘
        //   ),
        //   maxLength: 8,                     // 최대 입력 길이
        //   inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))], // 숫자 0~9만 입력
        // ),

        // 카드번호 형식 입력박스
        // body: TextField(
        //   controller: TextEditingController(),
        //   keyboardType: TextInputType.numberWithOptions(decimal: true),
        //   decoration: InputDecoration(
        //     labelText: 'Number',                   // 텍스트필드 위에 표시되는 입력된 텍스트명
        //     hintText: '12345',                     // 입력전에 표시되는 텍스트
        //     icon: Icon(Icons.calculate_outlined),    // 텍스트필드 앞에 표시되는 아이콘
        //   ),
        //   maxLength: 19,                       // ‘-‘을 포함하여 19자를 최대길이로 지정
        //   inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9 -]'))], // 숫자 0~9, ‘-‘ 입력
        // )

        //   비밀번호 입력
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     controller: TextEditingController(),
        //     keyboardType: TextInputType.visiblePassword,
        //     obscureText: true,                        // 입력텍스트를 '*'로 보여줌
        //     decoration: InputDecoration(
        //       labelText: 'Password',                  // 텍스트필드 위에 표시되는 입력된 텍스트명
        //       border: OutlineInputBorder(),           // 박스에 테두리
        //       icon: Icon(Icons.password),  // 텍스트필드 앞에 표시되는 아이콘
        //     ),
        //     maxLength: 8,
        //   ),
        // )
      ),
     );
  }
}
// 이메일
// body: TextField(
//   keyboardType: TextInputType.emailAddress,
//   controller: TextEditingController(),
//   decoration: InputDecoration(
//   labelText: 'Email',                // 텍스트필드 위에 표시되는 입력된 텍스트명
//   hintText: 'you@email.com',         // 입력전에 표시되는 텍스트
//   icon: Icon(Icons.mail_outline),    // 텍스트필드 앞에 표시되는 아이콘
// ),

// 숫자만 입력가능한 텍스트박스
// body: TextField(
//   controller: TextEditingController(),
//   keyboardType: TextInputType.number,
//   decoration: InputDecoration(
//     labelText: 'Number',                   // 텍스트필드 위에 표시되는 입력된 텍스트명
//     hintText: '12345',                     // 입력전에 표시되는 텍스트
//     icon: Icon(Icons.calculate_outlined),  // 텍스트필드 앞에 표시되는 아이콘
//   ),
//   maxLength: 8,
//   inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))], // 숫자 0~9만 입력
// )

// 카드번호형식 입력박스
// body: TextField(
//   controller: TextEditingController(),
//   keyboardType: TextInputType.numberWithOptions(decimal: true),
//   decoration: InputDecoration(
//   labelText: 'Number',                   // 텍스트필드 위에 표시되는 입력된 텍스트명
//   hintText: '12345',                     // 입력전에 표시되는 텍스트
//   icon: Icon(Icons.calculate_outlined),  // 텍스트필드 앞에 표시되는 아이콘
//   ),
//   maxLength: 19,
//   inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9 -]'))], // 숫자 0~9만 입력
// )