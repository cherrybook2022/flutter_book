void main() {
  // ⑤ switch - case 문
  List<int> statusCodes = [ 100, 200, 301, 302, 999];
  for (int status in statusCodes) {
    switch (status) {
      case 100 :
        print('$status : OPEN');
        break;
      case 200 :
        print('$status : APPROVED');
        break;
      case 301 :
      case 302 :
        print('$status : DENIED with Error');
        break;
      default :
        print('$status : unknown status');
    }
  }
}