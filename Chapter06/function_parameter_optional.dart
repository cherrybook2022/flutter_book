// 선택 매개변수 (optional positional parameter)
int multipleNumber2(int number, [int multiplier = 1]) => number * multiplier;

void main() {
  print(multipleNumber2(3,2));    //
  print(multipleNumber2(3));      //
}
