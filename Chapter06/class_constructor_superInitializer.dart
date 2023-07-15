class Person {
  String? name;

  Person(this.name) {
    print('Person Constructor Called..');
  }
}

class Student extends Person {
  int? studentId;

  Student(super.name, this.studentId) {    // super-initializer parameter
    print('Student Constructor Called..');
  }
}

void main() {
  var student = Student('Lee', 1002);
  print('${student.name} : ${student.studentId}');
}