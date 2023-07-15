void main() {
  // ① List 변수 선언 및 객체 생성
  var list = <dynamic>[];              // 객체 생성 : 리터럴(literal) 지정
  List<int> numbers1 = [1, 3, 7] ;     // 객체 생성 : 리터럴(literal) 지정
  List<int> numbers2 = List.empty();   // 객체 생성 : 생성자 호출
  List<int>? numbers;
  List<String> fruits1 = const ['apple', 'orange', 'mango'] ;  // 상수 객체 생성

  print('list : $list');               // empty list
  print('numbers : $numbers');         // null
  print('numbers1 : $numbers1');
  print('numbers1 first item : ${numbers1[0]}');      // ② 인덱스 사용하여 접근
  print('numbers1 last item : ${numbers1[numbers1.length-1]}');

  numbers2 = [0, ...numbers1, ...?numbers, 11];       // ③ 스프레드 연산자
  print('numbers2 : $numbers2');

  // ④ List 클래스의 프라퍼티와 메서드
  print('numbers2 has ${numbers2.length} items');     // length
  print('numbers2 first item : ${numbers2.first}');   // first
  print('numbers2 last item : ${numbers2.last}');     // last
  numbers2.add(13);                                   // add
  numbers2.addAll([17, 19]);                          // addAll
  print('numbers2 : $numbers2');
  numbers2.clear();                                   // clear
  print('numbers2 : $numbers2');
  if (numbers2.isEmpty) {                             // isEmpty
    print('numbers2 is empty');
  }

  list = [...fruits1,  100, 200.3];                   // List<dynamic>
  print('list : $list');

  List<String> fruits2 = fruits1 + ['melon', 'banana'];   // ⑤ + 연산자
  print('fruits2 : $fruits2');
  int index = fruits2.indexOf('mango');               // indexOf
  fruits2.removeAt(index);                            // removeAt
  fruits2.remove('melon');                            // remove
  print('fruits2 : $fruits2');
  fruits2.sort();                                     // sort
  print('fruits2 : $fruits2');
  print('fruits2 reversed : ${fruits2.reversed}');    // reversed
  if (fruits2.contains('apple')) {                    // contains
    print('fruits2 has apple');
  }

  print('fruits1 : $fruits1');
  //fruits1. add('berry');             // 에러 발생: 상수 객체에 대해 변경 불가
  fruits1 = ['strawberry', 'peach'];  // 다른 객체에 대한 참조로 변경
  print('fruits1 : $fruits1');
}