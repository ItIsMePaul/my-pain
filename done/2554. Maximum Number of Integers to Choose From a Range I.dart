class Solution {
  int maxCount(List<int> banned, int n, int maxSum) {
    int stopSum = 0;
    int ans = 0;
    for (var i = 1; i <= n; i++) {
      if (!banned.contains(i)) {
        stopSum += i;
        ans++;
        if (stopSum + i + 1 > maxSum) {
          break;
        }
      }
    }
    return ans;
  }
}
