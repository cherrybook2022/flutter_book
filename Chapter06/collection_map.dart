void main() {
  // ① Map 변수 선언 및 객체 생성
  var map1 = Map();                        // 객체 생성 : 생성자 호출
  var elements = Map<int, String>();       // 객체 생성 : 생성자 호출
  Map<String, String> capitals = {         // 객체 생성 : 리터럴 지정 (권장)
    //  key     :    value
    'South Korea' : 'Seoul',
    'France' : 'Paris',
  };

  // ② key-value 접근
  elements[1] = 'Hydrogen';                // add key-value
  elements[6] = 'C';                       // add key-value
  elements[6] = 'Carbon';                  // update value
  capitals['Italy'] = 'Rome';              // add key-value
  print('capitals : $capitals');
  print('elements : $elements');

  elements.update(8, (value) => 'Oxygen', ifAbsent: () => 'New'); // add key-value
  print('element No.8 is ${elements[8]}');
  elements.update(8, (value) => 'Oxygen', ifAbsent: () => 'New'); // update value
  print('element No.8 is ${elements[8]}');
  print('elements : $elements');

  // ③ Map 클래스의 프러퍼티와 메서드
  map1 = { ...elements, 10:'Neon'};        // ④ spread operator
  map1.remove(1);                          // remove
  print('map1 : $map1');
  print('map1 has ${map1.length} pairs');  // length
  if (!map1.containsKey(1)) {              // containKey
    print('map1 does not have element No.1');
  }
  print('map1.keys : ${map1.keys}');       // keys
  print('map1.values: ${map1.values}');    // values

  // ⑤ 사용자 정의 클래스 활용
  Map<int, Actor> actors = {
    1001 : Actor('Tom', 'Cruise'),
    1002 : Actor('Brad', 'Pitt'),
    1003 : Actor('Timothee', 'Chalamet'),
  };

  actors.forEach((key, value) {
    print('ActorID($key) : ${value.fullName}');
  });
  print("${actors[1002]!.firstName}'s last name is ${actors[1002]!.lastName}");
}

class Actor {
  String firstName;
  String lastName;
  late String fullName;

  Actor(this.firstName, this.lastName) {
    fullName = '$firstName $lastName';
  }
}