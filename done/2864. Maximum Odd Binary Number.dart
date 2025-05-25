class Solution {
  String maximumOddBinaryNumber(String s) {
    int countOnes = s.codeUnits.where((c) => c == 49).length;
    if (countOnes == 0 || s.length - countOnes == 0) return s;
    return '1' * (countOnes - 1) + '0' * (s.length - countOnes) + '1';
  }
}
