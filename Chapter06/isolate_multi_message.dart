import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'dart:isolate';

const filenames = [
  'D:\\book\\DataFiles\\data_file_01.txt',    // 파일경로1
  'D:\\book\\DataFiles\\data_file_02.txt',    // 파일경로2
  'D:\\book\\DataFiles\\data_file_03.txt',    // 파일경로3
];

Future<void> main() async {
  // _sendAndReceive 비동기 제네레이터 함수에서 생성한 stream으로부터
  // 이벤트 결과를 순차적으로 받아옵니다
  await for (final fileData in _sendAndReceive(filenames)) {
    print(fileData);
  }
}

// async* 를 지정한 비동기 제네레이터 함수입니다
// worker isolate를 생성하고, worker isolate로부터 수신한 파일내용을
// 수신할 때마다 main 함수로 반환합니다
Stream<String> _sendAndReceive(List<String> filenames) async* {
  // ReceivePort 를 생성합니다. worker isolate로부터 메시지를 수신할 때 사용합니다.
  // worker isolate 생성(spawn)하며, 생성 시 worker isolate의 시작함수와 port 정보를
  // 전달합니다
  final p = ReceivePort();
  await Isolate.spawn(_readFile, p.sendPort);

  // worker isolate가 전송하는 메시지를 수신받기 위해 StreamIterator 변수를 선언
  final events = StreamIterator<dynamic>(p);

  // worker isolate가 전송하는 첫번째 메시지는 SendPort 정보입니다.
  // 첫번째 메시지 수신을 기다렸다가 수신이 완료되면 SendPort 정보를 변수에 저장합니다.
  // 이 정보는 main isolate가 worker isolate에게 메시지를 보낼때 사용합니다
  late SendPort sendPort;
  if (await events.moveNext()) {
    sendPort = events.current;
  }

  // 각 파일에 대해서
  late String message;
  for (var filename in filenames) {
    // 파일명을 worker isolate 에게 전송합니다
    sendPort.send(filename);

    // ReceivePort 로 들어오는 응답메시지(파일 데이터)의 수신을 기다립니다
    if (await events.moveNext()) {
      message = events.current;

      // 수신한 메시지(파일 데이터)를 반환(yield) 합니다
      print('---file data : ${filename} ---');
      yield message;
    }
  }
  print('--------------------');

  // worker isolate에게 'isolate 종료 신호'(null)를 전송합니다
  sendPort.send(null);

  // StreamIterator를 폐기합니다
  await events.cancel();
}

// worker isolate 의 시작점이 되는 함수입니다
// main isolate로부터 메시지(파일명)를 수신받아 해당 파일을 읽고
// 그 내용을 main isolate로 전송(send) 합니다.
Future<void> _readFile(SendPort p) async {
  print('Spawned isolate started.');

  // ReceivePort 를 생성하고, 생성한 port 정보를 main isolate 에게 전송합니다
  // 이 port는 main isolate 에서는 worker isolate 로 메시지를 전송할 때 사용하고
  // worker isolate 에서는 main isolate 로부터 메시지를 수신할 때 사용합니다.
  final commandPort = ReceivePort();
  p.send(commandPort.sendPort);

  // main isolate 로부터의 메시지 수신을 기다립니다.
  // 즉, receivePort 스트림에서 이벤트 완료를 기다립니다
  await for (final message in commandPort) {
    if (message is String) {   // 메시지가 String 타입이면
      // 메시지를 파일명으로 간주하여 해당 파일을 String 타입으로 읽습니다
      final contents = await File(message).readAsString();

      // 파일내용을 main isolate 에게 전송합니다 (sendPort를 사용)
      p.send(contents);
    } else if (message == null) {   // 메시지가 null(종료 신호) 이면
      // main isolate 로부터 null을 수신하면 종료신호로 간주하여 isolate를 종료합니다
      break;
    }
  }

  print('Spawned isolate finished.');
  Isolate.exit();
}