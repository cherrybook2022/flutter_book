class Person {
  late String name;

  void hello() {
    print('Hello $name');
  }
}

class Student extends Person {
  late int studentId;

  @override
  void hello() {
    print('Hello ${super.name} (ID: $studentId) ');
  }

  void study(String subject) {
    print('${super.name} is studying $subject');
  }
}

void main() {
  var student = Student()
    ..name = 'Kim'
    ..studentId = 1001
    ..hello();
  student.study('Math');
}