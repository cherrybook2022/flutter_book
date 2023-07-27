// 널 조건부 연산자
void main() {
  String? nullableString;
  print(nullableString ?? 'alternative');  // ① ??  널 대체 연산자
  // print(nullableString != null ? nullableString : 'alternative');

  nullableString ??= 'alternative2';       // ② ??=  널 조건부 할당 연산자
  // nullableString = nullableString != null ? nullableString : 'alternative2';
  print(nullableString);
  print(stringLength(nullableString));     // ⑤

  String? nullString;
  print(nullString?.length);               // ⑥
  int len =  stringLength2(nullString)!;   // ③ !   not-null 확신 연산자
  print('$nullString (length:$len)');
}

int? stringLength(String? nullableString) {
  return nullableString?.length;           // ④ ?.  널 조건부 멤버접근 연산자
}

int? stringLength2(String? nullableString) {
  return nullableString != null ? nullableString.length : 0 ;
}
