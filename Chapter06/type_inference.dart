void main() {
  // 타입 추론
  // ① var
  var age = 30;           // int 타입
  var diameter = 3.7;     // double 타입
  var name = 'Bob';       // String 타입
  var check = true;       // bool 타입
  var colors = ['Red', 'Yellow', 'Blue'];  // List<String>

  //age = 30.5;            // 에러
  check = colors.isEmpty;  // ok

  // ② dynamic
  dynamic anyType;
  anyType = 10;          // ok
  anyType = 'Bob';       // ok
  if (anyType is String) {
    print('$anyType : ${anyType.length}');
  }

  // ③ Object
  Object anyObject;
  anyObject = 3.7;        // ok
  anyObject = 'Hello';    // ok
  if (anyObject is String) {
    print('$anyObject : ${anyObject.length}');
  }
}