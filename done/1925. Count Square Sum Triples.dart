import 'dart:math';

class Solution {
  int countTriples(int n) {
    int count = 0;
    for (var a = 1; a <= n; a++) {
      for (var b = a + 1; b <= n; b++) {
        for (var c = b + 1; c <= n; c++) {
          if (pow(a, 2) + pow(b, 2) == pow(c, 2)) {
            count += 2;
          }
        }
      }
    }
    return count;
  }
}
