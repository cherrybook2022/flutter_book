class Person {
  String? name;

  Person() {
    print('unnamed constructor with no-argument in Person');
  }
}

void main() {
  var employee1 = Person();
  print(employee1.name);
}