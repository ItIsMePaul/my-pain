class Solution {
  int findPermutationDifference(String s, String t) {
    int ans = 0;
    for (var i = 0; i < s.length; i++) {
      for (var j = 0; j < s.length; j++) {
        if (s[i] == t[j]) {
          ans += i - j > 0 ? i - j : j - i;
          break;
        }
      }
    }
    return ans;
  }
}
