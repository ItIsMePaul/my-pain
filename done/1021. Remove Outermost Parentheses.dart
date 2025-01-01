class Solution {
  String removeOuterParentheses(String s) {
    int firstPos = 0;
    int level = 0;
    for (var i = 0; i < s.length; i++) {
      if (level == 0 && s[i] == '(') {
        level++;
        firstPos = i;
        continue;
      }
      if (s[i] == '(') {
        level++;
        continue;
      }
      if (s[i] == ')') {
        level--;
      }
      if (level == 0 && s[i] == ')') {
        s = s.replaceRange(i, i + 1, '');
        s = s.replaceRange(firstPos, firstPos + 1, '');
        i -= 2;
      }
    }

    return s;
  }
}
