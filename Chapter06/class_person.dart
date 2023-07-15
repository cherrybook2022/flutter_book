class Person {
  // 멤버변수 선언
  late String name;
  int? _age;              // _ : private 멤버

  // 생성자
  Person() {
    print('Person Constructor Called..');
  }

  // 게터 & 세터
  int get age => _age ?? 0;              // 게터(getter)
  void set age(int age) => _age = age;   // 세터(setter)

  // 메서드
  void hello() {
    print('Hello $name');
  }
}