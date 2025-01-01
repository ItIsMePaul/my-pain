class Solution {
  String modifyString(String s) {
    if (s[0] == '?') {
      String replace = 'a';
      if (s.length > 1 && s[1] != '?') {
        while (replace == s[1]) {
          replace = String.fromCharCode(replace.codeUnits[0] + 1);
        }
      }
      s = s.replaceRange(0, 1, replace);
    }
    for (var i = 1; i < s.length - 1; i++) {
      if (s[i] == '?') {
        String replace = 'a';
        while (replace == s[i + 1] || replace == s[i - 1]) {
          replace = String.fromCharCode(replace.codeUnits[0] + 1);
        }
        s = s.replaceRange(i, i + 1, replace);
      }
    }
    if (s[s.length - 1] == '?') {
      String replace = 'a';
      if (s.length > 1 && s[s.length - 1 - 1] != '?') {
        while (replace == s[s.length - 2]) {
          replace = String.fromCharCode(replace.codeUnits[0] + 1);
        }
      }
      s = s.replaceRange(s.length - 1, s.length, replace);
    }
    return s;
  }
}
