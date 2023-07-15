class Person {
  String? name;

  Person() {
    print('Person unnamed Constructor Called..');
  }
}

class Student extends Person {
  int? studentId;

  Student() {
    print('Student unnamed Constructor Called..');
  }
}

void main() {
  var student = Student();
  print(student.name);
}