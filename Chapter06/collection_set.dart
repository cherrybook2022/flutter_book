void main() {
  // ① Set 변수 선언 및 객체 생성
  var set1 = <dynamic>{};                  // 객체 생성 : empty
  var oddNumbers = {3,7,1,9,3,5};          // 객체 생성 : {3,7,1,9,5}
  Set<int> primeNumbers = {2,3,5,7};       // 객체 생성 : {2,3,5,7}

  // ② Set 사용
  print('(a) oddNumbers : $oddNumbers');
  for (int each in oddNumbers) {
    print(' each oddNumber is $each');
  }
  print('(b) primeNumbers : $primeNumbers');
  primeNumbers.forEach(print);

  // ③ Set의 수학적 집합 연산
  Set<int> a = oddNumbers;
  Set<int> b = primeNumbers;
  print('(a) union (b) = ${a.union(b)}');                // 합집합
  print('(a) intersection (b) = ${a.intersection(b)}');  // 교집합
  print('(a) difference (b) = ${a.difference(b)}');      // 차집합

  List<int> list = oddNumbers.toList();            // ④ toList
  print('list : $list');
  if (oddNumbers == a) {                           // ⑤ == 연산자
    print('a and oddNumbers refer same object');
  }
}