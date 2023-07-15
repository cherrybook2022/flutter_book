import './class_person.dart';

void main() {
  var person1 = new Person();  // ① 객체생성 : new 키워드 사용/생략 가능
  person1.name = 'Leo';        // ②
  //person1._age = 19;         // ③ 에러: private 변수에 직접 접근 불가
  person1.age = 19;            // ④ 세터(setter)를 통한 접근
  person1.hello();             // ②
  print('${person1.name} : age : ${person1.age}' );

  var person2 = Person()       // ⑤ 객체생성 : new 키워드 생략
    ..name = 'Jane'            // .. : 캐스캐이드 표기법
    ..hello();
  print('${person2.name} : age : ${person2.age}' );

  Person? person3;             // ⑥ Person 타입의 변수 선언
  person3?.hello();            // ?. : 널 조건부 접근 연산자
  person3 = person2;
  if (identical(person2, person3)) {
    // 하나의 같은 객체에 대한 참조를 가짐
    print('same object');
    person3.hello();
  }
}