import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('이전페이지로!!!~!'),
        ),
      ),
    );
  }
}
