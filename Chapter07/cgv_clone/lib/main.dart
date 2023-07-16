import 'package:cgv_clone/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cgv_clone/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp( // 파이어베이스를 초기화합니다.
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'CGV Clone',
          debugShowCheckedModeBanner: false,
          home: MyHomePage(), // 홈 화면을 지정합니다.
        );
      },
    );
  }
}
