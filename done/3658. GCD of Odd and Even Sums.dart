class Solution {
  int gcdOfOddEvenSums(int n) {
    int gcd(int a, int b) {
      if (b == 0)
        return a;
      else
        return gcd(b, (a % b));
    }

    int oddSum = 0;
    int evenSum = 0;
    for (var i = 1; i <= n * 2; i++) {
      i % 2 == 1 ? oddSum += i : evenSum += i;
    }
    return gcd(oddSum, evenSum);
  }
}
