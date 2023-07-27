mixin Classic {
  canClassic() {
    print('can do classic');
  }
}

mixin Musical {
  canMusical() {
    print('can do musical');
  }
}

class Person {
  String name;

  Person(this.name);
}

class Maestro extends Person with Classic, Musical {   // 믹스인(mixin) 사용
  late bool canConduct;

  Maestro(super.name) {
    canConduct = true;
  }
  introduce() {
    print('Mestro is $name');
    canClassic();
    canMusical();
  }
}

main(){
  var maestro = Maestro('Jung')
    ..introduce()
  ;
}
