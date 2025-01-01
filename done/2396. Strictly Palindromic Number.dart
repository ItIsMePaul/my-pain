class Solution {
  bool isStrictlyPalindromic(int n) {
    for (var i = 2; i <= n - 2; i++) {
      String temp = n.toRadixString(i);
      for (var i = 0; i < temp.length ~/ 2; i++) {
        if (temp[i] != temp[temp.length - i - 1]) {
          return false;
        }
      }
    }
    return true;
  }
}
