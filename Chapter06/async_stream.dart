// asynchronous generator function
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await Future.delayed(const Duration(seconds: 1), () => print('generating...$i'));  // 1초 대기
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  print('waiting for the value..');
  await for (final value in stream) {
    sum += value;
    print('received.....$value --> sum : $sum');
  }
  return sum;
}

void main() async {
  var stream = countStream(5);
  var sum = await sumStream(stream);
  print(sum);
}