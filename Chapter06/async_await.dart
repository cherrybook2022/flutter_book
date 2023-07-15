Future<void> createOrderMessage() async {
  var order = await fetchOrder();   // ① await 지정: 작업 종료를 기다림
  print('Your order is: $order');
}

Future<String> fetchOrder() =>
    Future.delayed(const Duration(seconds: 2), () => 'Hot Americano');

void main() async {
  createOrderMessage();            // ② await 미지정: 작업 종료를 기다리지 않음
  print('Fetching user order...');
}