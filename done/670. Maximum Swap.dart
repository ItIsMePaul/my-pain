class Solution {
  int maximumSwap(int num) {
    List<String> digits = num.toString().split('');
    List<String> sortedDigits = num.toString().split('')
      ..sort((e1, e2) => e2.compareTo(e1));
    Map<String, int> map = {};
    for (var i = 0; i < digits.length; i++) map[digits[i]] = i;
    for (var i = 0; i < digits.length; i++) {
      if (sortedDigits[i] != digits[i]) {
        String temp = digits[i];
        digits[map[sortedDigits[i]]!] = temp;
        digits[i] = sortedDigits[i];
        return int.parse(digits.join());
      }
    }
    return num;
  }
}

void main() {
  print(Solution().maximumSwap(1993));
}
