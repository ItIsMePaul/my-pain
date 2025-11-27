class Solution {
  bool checkString(String s) {
    for (var i = 0; i < s.length - 1; i++) {
      if (s[i].codeUnits[0] > s[i + 1].codeUnits[0]) {
        return false;
      }
    }
    return true;
  }
}
