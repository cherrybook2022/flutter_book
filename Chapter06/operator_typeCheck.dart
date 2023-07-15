void main() {
  Object a = 'hello';

  if (a is String) {
    print('문자열');
  }
  if (a is! num) {
    print('숫자 아님');
  }

  String b = a as String;
  print(b.toUpperCase());
}