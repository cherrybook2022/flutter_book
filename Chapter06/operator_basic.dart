void main() {
  // ① 산술연산자, 할당연산자
  int num1 = 99;
  num1 += 1;         // num1 = num1 + 1
  print('num1 = $num1');
  print('$num1 ~/ 3 = ${num1~/3}');   // 몫

  // ② 증감연산자
  print('num1 = ${num1++}');
  print('num1 = ${++num1}');

  // ③ 관계연산자(비교연산자)
  const String adminUser = 'admin';
  String user = 'user01';
  if (user == adminUser) {
    print('관리자입니다');
  }
  else {
    print('$user 은 일반사용자 입니다');
  }

  // ④ 논리연산자
  if (num1 > 100 && num1.isEven) {
    print('$num1 은 100보다 큰 짝수이다');
  }
  // ⑤ 비트/시프트연산자
  int num2 = 0x03;    // 0x03 : 0000 0011
  num2 &= 0x0e;       // 0x0e : 0000 1110
  print(num2);        //  &   : 0000 0010 = 2
  num2 <<= 2;         // <<2  : 0000 1000 = 8
  print('$num2 : ${num2.toRadixString(2) }');

  // ⑥ 삼항연산자
  String result = user == adminUser ? '관리자입니다' : '$user 은 일반사용자 입니다';
  print(result);
}