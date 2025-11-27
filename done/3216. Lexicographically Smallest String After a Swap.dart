class Solution {
  String getSmallestString(String s) {
    for (var i = 0; i < s.length - 1; i++) {
      int fn = int.parse(s[i]);
      int sn = int.parse(s[i + 1]);
      if (fn > sn && sn % 2 == fn % 2) {
        return s.substring(0, i) + '$sn' + '$fn' + s.substring(i + 2, s.length);
      }
    }
    return s;
  }
}
