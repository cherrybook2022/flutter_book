void main() {
  int num1 = 10;
  double num2 = 3.141592;

  // ① 숫자->문자 변환
  String str1 = num1.toString();
  String str2 = num2.toStringAsFixed(2);
  print('num1 to str is $str1');
  print('num2 to str is $str2');

  // ② 문자->숫자 변환
  num1 = int.parse('-12');
  num2 = double.parse('123.4567');
  print(num1);
  print(num2);
  print('${num.parse('-34.56')}');
}