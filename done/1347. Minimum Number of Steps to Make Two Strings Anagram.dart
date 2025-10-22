class Solution {
  int minSteps(String s, String t) {
    Map<String, int> map = {};
    for (var i = 0; i < s.length; i++) {
      map[s[i]] = (map[s[i]] ?? 0) + 1;
      map[t[i]] = (map[t[i]] ?? 0) - 1;
    }
    int result = 0;
    for (var key in map.keys) if (map[key]! > 0) result += map[key]!;
    return result;
  }
}
