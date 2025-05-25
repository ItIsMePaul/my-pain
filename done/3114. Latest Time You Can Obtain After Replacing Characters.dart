class Solution {
  String findLatestTime(String s) {
    if (s[0] == '?') {
      if (s[1] == '?' || s[1] == '0' || s[1] == '1') {
        s = s.replaceRange(0, 1, '1');
      } else {
        s = s.replaceRange(0, 1, '0');
      }
    }
    if (s[1] == '?') {
      if (s[0] == '1') {
        s = s.replaceRange(1, 2, '1');
      } else {
        s = s.replaceRange(1, 2, '9');
      }
    }
    if (s[3] == '?') {
      s = s.replaceRange(3, 4, '5');
    }
    if (s[4] == '?') {
      s = s.replaceRange(4, 5, '9');
    }
    return s;
  }
}
