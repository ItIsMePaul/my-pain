class Solution {
  String minRemoveToMakeValid(String s) {
    int level = 0;
    for (var i = 0; i < s.length; i++) {
      if (s[i] == '(') level++;
      if (s[i] == ')') level--;
      if (level < 0) {
        level = 0;
        s = s.replaceRange(i, i + 1, '');
      }
    }
    if (level > 0) {
      for (var i = s.length - 1; i >= 0; i++) {
        if (level == 0) return s;
        if (s[i] == '(') {
          level--;
          s = s.replaceRange(i, i + 1, '');
        }
      }
    }
    return s;
  }
}
