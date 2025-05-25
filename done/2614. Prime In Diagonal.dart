class Solution {
  int diagonalPrime(List<List<int>> nums) {
    bool isPrime(int n) {
      if (n < 2) return false;
      if (n % 2 == 0) return n == 2;
      for (var i = 3; i * i <= n; i += 2) {
        if (n % i == 0) {
          return false;
        }
      }
      return true;
    }

    int ans = 0;
    for (var i = 0; i < nums.length; i++) {
      int d1 = nums[i][i];
      if (d1 > ans && isPrime(d1)) ans = d1;

      int d2 = nums[i][nums.length - 1 - i];
      if (d2 > ans && isPrime(d2)) ans = d1;
    }
    return ans;
  }
}
