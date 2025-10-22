class Solution {
  int maximumLengthSubstring(String s) {
    Map<String, int> map = {};
    int result = 0;
    int left = 0;
    int right = 0;
    for (var i = 0; i < s.length; i++) {
      map[s[i]] = (map[s[i]] ?? 0) + 1;
      right++;
      while (map[s[i]]! > 2) {
        map[s[left]] = map[s[left]]! - 1;
        left++;
      }
      if (right - left > result) {
        result = right - left;
      }
    }
    return result;
  }
}
