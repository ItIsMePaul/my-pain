class Solution {
  int totalNumbers(List<int> digits) {
    Set<String> set = {};
    for (var i = 0; i < digits.length; i++) {
      for (var j = 0; j < digits.length; j++) {
        for (var l = 0; l < digits.length; l++) {
          if (digits[i] != 0 &&
              digits[l] % 2 == 0 &&
              i != j &&
              j != l &&
              l != i) {
            String s =
                digits[i].toString() +
                digits[j].toString() +
                digits[l].toString();
            set.add(s);
          }
        }
      }
    }
    return set.length;
  }
}
