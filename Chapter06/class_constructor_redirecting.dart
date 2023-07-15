class Person {
  String name;

  Person(this.name);

  Person.newborn() : this('To be determined..');   // 재전송 생성자(redirecting constructor)
}

void main() {
  var baby1 = Person('Tom');
  var baby2 = Person.newborn();
  print('Baby1 name: ${baby1.name}');
  print('Baby2 name: ${baby2.name}');
}