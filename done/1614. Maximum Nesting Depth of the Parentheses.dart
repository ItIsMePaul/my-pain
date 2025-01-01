class Solution {
  int maxDepth(String s) {
    int current = 0;
    int ans = 0;
    for (var i = 0; i < s.length; i++) {
      if (s[i] == '(' || s[i] == ')') {
        if (s[i] == '(') {
          current++;
        } else {
          current--;
        }
        if (current > ans) {
          ans = current;
        }
      }
    }
    return ans;
  }
}
