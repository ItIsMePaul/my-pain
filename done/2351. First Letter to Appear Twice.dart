class Solution {
  String repeatedCharacter(String s) {
    Set<String> ans = {};
    for (var i = 0; i < s.length; i++) {
      if (ans.contains(s[i])) {
        return s[i];
      } else {
        ans.add(s[i]);
      }
    }
    return s[0];
  }
}
