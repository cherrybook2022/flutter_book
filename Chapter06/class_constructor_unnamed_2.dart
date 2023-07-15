class Person {
  String? name;

  Person(this.name) {
    print('unnamed constructor with arguments in Person');
  }
}

void main() {
  var employee2 = Person('Lee');
  print(employee2.name);
}