void printNumber(Function func, int num)
{
  func(num);
}

void printEvenNumber(int num) {
  print('$num is even number');
}

void printOddNumber(int num) {
  print('$num is odd number');
}

void main() {
  int num;
  Function func;

  // ① 변수에 함수 객체를 할당 & 함수객체를 호출
  num = 3;
  func = num.isEven ? printEvenNumber : printOddNumber;
  func(num);

  // ② 함수 객체를 다른 함수의 매개변수로 사용
  num = 4;
  func = num.isEven ? printEvenNumber : printOddNumber;
  printNumber(func, num);
}
