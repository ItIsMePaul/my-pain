class SOlution {
  String makeGood(String s) {
    List<String> ss = s.split('');
    for (var i = 0; i < ss.length - 1; i++) {
      if (ss[i].codeUnits[0] > 96 && ss[i].codeUnits[0] < 123) {
        if (ss[i].toUpperCase() == ss[i + 1]) {
          ss.removeAt(i + 1);
          ss.removeAt(i);
          i = -1;
          continue;
        }
      }
      if (ss[i].codeUnits[0] > 64 && ss[i].codeUnits[0] < 91) {
        if (ss[i].toLowerCase() == ss[i + 1]) {
          ss.removeAt(i + 1);
          ss.removeAt(i);
          i = -1;
          continue;
        }
      }
    }
    return ss.join();
  }
}
