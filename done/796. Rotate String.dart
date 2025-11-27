class Solution {
  bool rotateString(String s, String goal) {
    int i = 0;
    while (i <= s.length) {
      if (s == goal) {
        return true;
      }
      String c = s[0];
      s = s.substring(1);
      s += c;
      i++;
    }
    return false;
  }
}
