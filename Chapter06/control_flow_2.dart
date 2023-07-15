void main() {
  // ② for 문
  List<String> colors = ['Yellow', 'Red', 'Blue'];
  for (int i=0; i<colors.length; i++) {
    print(colors[i]);
  }
  // for (String color in colors) {
  //   print(color);
  // }

  // ③ while 문
  int i = 0;
  while (i < colors.length) {
    print(colors[i]);
    i++;
  }

  // ④ do-while 문
  int j = 3;
  do {
    print(j--);
  } while (j > 0);
  do {
    print(j--);
  } while (j > 0);
}