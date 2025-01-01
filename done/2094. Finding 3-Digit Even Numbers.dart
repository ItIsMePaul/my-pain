class Solution {
  List<int> findEvenNumbers(List<int> digits) {
    digits.sort();
    List<int> result = [];
    for (var e = 0; e < digits.length; e++) {
      for (var r = 0; r < digits.length; r++) {
        for (var t = 0; t < digits.length; t++) {
          if (digits[e] != 0) {
            int number = 100 * digits[e] + digits[r] * 10 + digits[t];
            if (number % 2 == 0 &&
                e != r &&
                r != t &&
                t != e &&
                !result.contains(number)) {
              result.add(number);
            }
          }
        }
      }
    }
    return result;
  }
}
