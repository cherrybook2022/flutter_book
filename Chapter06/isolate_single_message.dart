import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'dart:isolate';

Future<void> main() async {
  // Read some data.
  final filename = 'D:\\book\\DataFiles\\data_file_01.txt';  // ⓐ 데이터파일 경로
  final receivedData = await _readInBackground(filename);

  // Use that data
  print(receivedData);
}

// Spawns an isolate and waits for the first message
Future<String> _readInBackground(String filename) async {
  final p = ReceivePort();               // ① ReceivePort 생성
  await Isolate.spawn(_readFile, [p.sendPort, filename]);  // ② worker isolate 생성
  return (await p.first) as String;      // ③ ReceivePort Stream의 첫번째 메세지를 반환
}

// worker isolate 가 수행하는 함수
Future<void> _readFile(List<dynamic> args) async {
  SendPort sendPort = args[0];
  String fileName = args[1];

  String fileData = await File(fileName).readAsString();   // read file
  Isolate.exit(sendPort, fileData);     // ④ isolate exit & send result
}