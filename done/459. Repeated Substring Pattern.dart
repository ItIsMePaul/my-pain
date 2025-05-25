class Solution {
  bool repeatedSubstringPattern(String s) {
    for (var i = s.length ~/ 2; i >= 1; i--) {
      if (s.length % i != 0) continue;
      int count = 1;
      for (var j = 0; j < s.length - i; j += i) {
        if (s.substring(j, j + i) == s.substring(j + i, j + i + i)) {
          count++;
        } else {
          break;
        }
      }
      if (count == s.length ~/ i) {
        return true;
      }
    }
    return false;
  }
}
