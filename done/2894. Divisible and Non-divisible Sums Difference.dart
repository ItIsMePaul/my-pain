class Solution {
  int differenceOfSums(int n, int m) {
    int num1 = 0, num2 = 0;
    for (var i = 1; i <= n; i++) {
      if (i % m != 0) {
        num1 += i;
      } else {
        num2 += i;
      }
    }
    return num1 - num2;
  }
}