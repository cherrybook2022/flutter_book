Future<void> fetchOrder1 () async {
  // 4초 후에 출력
  return Future.delayed(const Duration(seconds: 4), () => print('Orange Juice'));
}

Future<void> fetchOrder2 () async {
  // 2초 후에 출력
  return Future.delayed(const Duration(seconds: 2), () => print('Ice Latte'));
}

void main() {
  fetchOrder1();
  fetchOrder2();
  print('Fetching data...');
  print('Fetching data....');
}