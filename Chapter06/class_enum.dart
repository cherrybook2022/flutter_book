enum Color {red, green, blue}         // ① enum Color 타입 선언

main() {
  print(Color.values);
  List<Color> color = Color.values;   // ② Color.values: enum Color의 모든 열거 값을 조회
  print(color);

  // ③ index, name 멤버
  print('index ${Color.red.index} : ${Color.red.name}');
  print('index ${Color.green.index} : ${Color.green.name}');
  print('index ${Color.blue.index} : ${Color.blue.name}');

  final favorite = Color.green;       //
  print('favorite color is ${favorite.name}');

  var aColor = Color.blue;
  switch (aColor) {
    case (Color.red) :
      print('red color');
      break;
    case (Color.green):
      print('green color');
      break;
    default :     // ④ 주석 처리하면 경고 메시지 발생
      print(aColor);
  }
}