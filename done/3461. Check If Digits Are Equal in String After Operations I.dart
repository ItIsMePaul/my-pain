class Solution {
  bool hasSameDigits(String s) {
    while (s.length > 2) {
      StringBuffer temp = StringBuffer();
      for (var i = 0; i < s.length - 1; i++) {
        temp.write((int.parse(s[i]) + int.parse(s[i + 1])) % 10);
      }
      s = temp.toString();
    }
    return s[0] == s[1];
  }
}

