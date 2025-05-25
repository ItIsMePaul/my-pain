class Solution {
  int maxScore(String s) {
    int ans = 0;
    for (var i = 0; i < s.length - 1; i++) {
      int temp = 0;
      String left = s.substring(0, i + 1);
      String right = s.substring(i + 1);
      for (var j = 0; j < left.length; j++) if (left[j] == '0') temp++;
      for (var j = 0; j < right.length; j++) if (right[j] == '1') temp++;
      ans = ans > temp ? ans : temp;
    }
    return ans;
  }
}
