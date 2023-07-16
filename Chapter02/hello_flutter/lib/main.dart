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
      theme: ThemeData(
          textTheme: GoogleFonts.aladinTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.green
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter',
              style: TextStyle (
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              )
          ),
          actions: [
            Icon(Icons.shopping_cart),   // 쇼핑카트 아이콘, 아이콘 색상은 기본색상인 흰색으로 표시
            SizedBox(width:10),         // 위젯간 여백 조정, 폭이 10px크기인 사각형박스
            Icon(Icons.search_rounded,  // 검색 아이콘, 아이콘 색상은 redAccent로 세팅
                color: Colors.redAccent),
            SizedBox(width:10),         // 위젯간 여백 조정
            Icon(Icons.settings,         // 설정 아이콘, 아이콘 색상은 purpleAccent으로 세팅
                color: Colors.purpleAccent),
            SizedBox(width:40),        // 위젯간 여백 조정
          ],
        ),
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color:Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
