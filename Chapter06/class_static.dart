class Circle {
  late double diameter;             // 지름
  static const double pi = 3.14;    // 원주율

  Circle(this.diameter);

  // 원주 구하기 : static 메서드
  static double getCircumference(double diameter) {
    return diameter * pi;
  }

  // 원주 구하기 : 인스턴스 메서드
  double circumference() {
    return diameter * pi;
  }
}

main () {
  print(Circle.pi);                    // 클래스명을 통한 static 멤버 접근
  print(Circle.getCircumference(10));  // 클래스명을 통한 static 멤버 접근

  var circle = Circle(5);              // 객체 생성
  print(circle.circumference());       // 객체를 통한 인스턴스 메서드 접근
}