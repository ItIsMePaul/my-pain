class Solution {
  bool isThree(int n) {
    int ans = 2;
    for (var i = 2; i <= n / 2; i++) {
      if (n % i == 0) {
        ans++;
      }
      if (ans > 3) {
        break;
      }
    }
    if (ans == 3) {
      return true;
    } else {
      return false;
    }
  }
}
