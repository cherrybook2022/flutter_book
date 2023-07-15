// 이름있는 매개변수 (named parameter)
void printUserInfo(String name, {required int age, String gender = 'unknown'}) {
  print('name: $name, age:$age, gender:$gender');
}

void main() {
  printUserInfo('홍길동', gender:'남', age:30);  //
  printUserInfo('홍길동', age:30);               //
  // printUserInfo('홍길동');                    // 에러
}
