class Solution {
  bool buddyStrings(String s, String goal) {
    if (s.length < 2 || s.length != goal.length) return false;
    if (s == goal) {
      Map<String, int> map = {};
      for (var i = 0; i < s.length; i++) {
        map[s[i]] = (map[s[i]] ?? 0) + 1;
        if (map[s[i]]! >= 2) return true;
      }
      return false;
    }
    int first = 0, second = 1;
    bool isFirst = true;
    for (var i = 0; i < s.length; i++) {
      if (s[i] != goal[i] && isFirst) {
        first = i;
        isFirst = false;
      }
      if (isFirst) continue;
      if (s[i] != goal[i] && !isFirst) {
        second = i;
      }
    }
    String temp = s[first];
    s = s.replaceRange(first, first + 1, s[second]);
    s = s.replaceRange(second, second + 1, temp);
    if (s == goal) return true;
    return false;
  }
}
