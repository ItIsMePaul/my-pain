class Solution {
  int totalMoney(int n) {
    int j = n ~/ 7;
    int ans = 0;
    if (j > 0) {
      for (var i = 0; i < j; i++) {
        ans += (28 + i * 7);
      }
      n -= j * 7;
    }
    for (var i = 1; i <= n; i++) {
      ans += j + i;
    }
    return ans;
  }
}
