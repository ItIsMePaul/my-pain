class Solution {
  int minChanges(String s) {
    int result = 0;
    for (var i = 0; i < s.length; i += 2) if (s[i] != s[i + 1]) result++;
    return result;
  }
}
