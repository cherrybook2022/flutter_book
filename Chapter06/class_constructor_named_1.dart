class Person {
  String? name;

  Person.init(this.name) {
    print('named constructor in Person');
  }
}

void main() {
  var employee3 = Person.init('Kim');
  print(employee3.name);
}