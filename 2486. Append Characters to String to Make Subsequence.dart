class Solution {
  int appendCharacters(String s, String t) {
    int pos = 0;
    for (var i = 0; i < s.length && pos < t.length; i++) {
      if (s[i] == t[pos]) {
        pos++;
      }
    }
    return t.length - pos;
  }
}
