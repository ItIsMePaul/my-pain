class Solution {
  int maxScore(String s) {
    int ans = 0;
    for (var i = 0; i < s.length - 1; i++) {
      String left = s.substring(0, i + 1);
      String right = s.substring(i + 1);
      for (var j = 0; j < left.length; j++) if (left[j] == '0') ans++;
    }
    return ans;
  }
}
