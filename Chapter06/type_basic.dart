void main() {
  // ① 숫자형 타입
  int num1 = 10;       // 정수형 숫자
  double pi = 3.14;    // 실수형 숫자

  //int num2 = num1 * pi;    // 에러
  double num3 = num1 * pi;
  num num4 = num1 * pi;      // num은 정수형, 실수형 모두 포함

  print(num3);
  print(num4);

  // ② 문자열 타입
  String firstName = 'Gildong';   // 작은따옴표 가능, 권장
  String sirName = "Hong";        // 큰따옴표 가능
  String fullName;
  fullName = sirName + ' ' + firstName;   // '+' 연산자 사용가능하나 권장하지 않음
  fullName = '$sirName $firstName';       // 권장
  print('Hello, $firstName');
  print('$fullName : ${fullName.length}');

  // ③ 불리언 타입
  bool aa = false;
  bool bb = (num1 > 0);      // true
  bool chk = aa && bb;       // false
  print('check result is $chk');
}