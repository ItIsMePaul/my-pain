class Solution {
  bool isIsomorphic(String s, String t) {
    Map<String, String> code = {};
    Map<String, int> countS = {};
    Map<String, int> countT = {};
    for (var i = 0; i < s.length; i++) {
      countS[s[i]] = (countS[s[i]] ?? 0) + 1;
      countT[t[i]] = (countT[t[i]] ?? 0) + 1;
    }
    for (var i = 0; i < s.length; i++) {
      if (code.containsKey(s[i]) || code.containsValue(t[i])) {
        if (code[s[i]] != t[i] || countT[t[i]] != countS[s[i]]) {
          return false;
        }
      } else {
        code[s[i]] = t[i];
      }
    }
    return true;
  }
}
