class Solution {
  bool isUgly(int n) {
    if (n == 0) return false;
    n = _divide(n, 2);
    n = _divide(n, 3);
    n = _divide(n, 5);
    return n == 1;
  }

  int _divide(int number, int divider) {
    while (number % divider == 0) {
      number = number ~/ divider;
    }
    return number;
  }
}
