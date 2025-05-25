class Solution {
  int minimumMoves(String s) {
    int ans = 0;
    for (var i = 0; i < s.length; i++) {
      if (s[i] == 'X') {
        ans++;
        for (var j = i; j < i + 3 && j < s.length; j++) {
          s = s.replaceRange(j, j + 1, 'O');
        }
        i += 2;
      }
    }
    return ans;
  }
}
