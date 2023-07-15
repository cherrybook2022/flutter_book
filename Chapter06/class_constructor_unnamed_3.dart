class Person {
  String? name;

  Person([String? name]) {
    print('unnamed constructor in Person');
    this.name = name;
  }
}

void main() {
  var employee1 = Person();
  var employee2 = Person('Lee');
  print(employee1.name);
  print(employee2.name);
}