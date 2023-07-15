class Musician {
  String name;
  Musician(this.name);
}

mixin Classic on Musician {   // Musician의 서브클래스에서만 믹스인 사용 가능하도록 제한함
  canClassic() {
    print('can do classic');
  }
}

class Maestro extends Musician with Classic {
  Maestro(super.name);

  introduce() {
    print('Mestro is $name');
    canClassic();           // 믹스인의 멤버를 호출
  }
}

main(){
  var maestro = Maestro('Jung')
    ..introduce();
}