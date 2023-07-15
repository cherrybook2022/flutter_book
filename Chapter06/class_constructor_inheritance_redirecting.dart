class Person {
  String? name;

  Person(this.name) {
    print('Person Constructor Called..');
  }
}

class Student extends Person {
  int? studentId;

  Student(String name, this.studentId) : super(name) {  // redirecting constructor
    print('Student Constructor Called..');
  }
}

void main() {
  var student = Student('Lee', 1002);
  print('${student.name} : ${student.studentId}');
}