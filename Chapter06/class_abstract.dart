abstract class Person {
  //
  // 멤버변수, 메서드 정의
  //
  void working();   // 추상 메서드 선언
}

class Developer implements Person {    // extends, implements 키워드 모두 사용 가능
  @override
  void working() {
    print('Developer is working..');
  }
}

void main() {
  var developer = Developer();
  developer.working();
}