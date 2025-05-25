class Solution {
  bool canBeValid(String s, String locked) {
    if (s.length.isOdd) return false;
    if ((locked[0] == '1' && s[0] == ')') ||
        (locked[s.length - 1] == '1' && s[s.length - 1] == '(')) return false;
    int level = 0;
    for (var i = 0; i < s.length; i++) {
      if (s[i] == ')') {
        level--;
      } else {
        level++;
      }
      if (level < 0) {
        if (locked[i] == '0') {
          level += 2;
        } else {
          return false;
        }
      }
    }
    level = 0;
    for (var i = s.length - 1; i >= 0; i--) {
      if (s[i] == ')') {
        level++;
      } else {
        level--;
      }
      if (level < 0) {
        if (locked[i] == '0') {
          level += 2;
        } else {
          return false;
        }
      }
    }

    return true;
  }
}
