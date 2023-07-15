class Person {
  String? name;

  Person() {
    print('unnamed constructor in Person');
  }

  Person.init(this.name) {
    print('named constructor in Person');
  }
}

void main() {
  var employee1 = Person();
  var employee3 = Person.init('Kim');
  print(employee1.name);
  print(employee3.name);
}