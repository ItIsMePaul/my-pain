class Solution {
  int countGoodSubstrings(String s) {
    int ans = 0;
    for (var i = 0; i < s.length - 2; i++) {
      if (s[i] != s[i + 1] && s[i] != s[i + 2] && s[i + 1] != s[i + 2]) ans++;
    }
    return ans;
  }
}
