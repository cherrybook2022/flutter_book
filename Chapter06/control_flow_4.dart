void main() {
  // ⑥ break
  const int commandShutdown = 3;
  for (int command = 1; ; command++) {
    if (command == commandShutdown) {
      break;
    }
    processCommand(command);
  }

  // ⑦ continue
  const int meetApplicantCount = 5;
  bool isClassOpen = false;
  for (int applicantCount = 0; !isClassOpen; applicantCount++) {
    if (applicantCount < meetApplicantCount) {
      continue;
    }
    isClassOpen = classOpen();
  }
}

void processCommand(int command) {
  print('$command : command processed');
}

bool classOpen() {
  print('class opened');
  return true;
}
