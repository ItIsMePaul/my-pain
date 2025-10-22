import 'dart:math';

class Solution {
  int splitArray(List<int> nums) {
    bool isPrime(int n) {
      if (n <= 1) return false;
      for (int i = 2; i <= sqrt(n); i++) if (n % i == 0) return false;
      return true;
    }

    int A = 0;
    int B = 0;
    for (var i = 0; i < nums.length; i++) {
      if (isPrime(i)) {
        A += nums[i];
      } else {
        B += nums[i];
      }
    }
    return (A - B).abs();
  }
}
