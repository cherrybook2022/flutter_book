class Person {
  String? name;

// 생성자가 정의되지 않음
}

void main() {
  var employee1 = Person();    // 다트가 제공하는 기본생성자(default constructor)를 사용
  print(employee1.name);
}