class Solution {
  bool hasAlternatingBits(int n) {
    String binary = '';
    while (n >= 1) {
      if (n % 2 == 1) {
        binary += '1';
      } else {
        binary += '0';
      }
      n ~/= 2;
    }
    for (var i = 0; i < binary.split('').length; i++) {
      if (i != binary.split('').length - 1) {
        if (binary.split('')[i] == binary.split('')[i + 1]) {
          return false;
        }
      }
    }
    return true;
  }
}
