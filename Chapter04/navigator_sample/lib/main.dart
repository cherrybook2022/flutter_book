import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'navigation example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
      ),
      body: const Center(
        child: Text(
          '아래버튼을 눌러 다음페이지로!!!',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      // 첫페이지에 플로팅 버튼을 작성합니다.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: OutlinedButton(      // 아웃라인버튼
          onPressed: () {
            Navigator.pop(context);  // 이전 페이지인 홈화면으로 이동
          },
          child: Text('이전페이지로!'), // 버튼 텍스트
        ),
      ),
    );
  }
}
