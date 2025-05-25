class Solution {
  String makeSmallestPalindrome(String s) {
    for (var i = 0; i < s.length ~/ 2; i++) {
      if (s[i] != s[s.length - 1 - i]) {
        if (s[i].codeUnits[0] > s[s.length - 1 - i].codeUnits[0]) {
          s = s.replaceRange(i, i + 1, s[s.length - 1 - i]);
        } else {
          s = s.replaceRange(s.length - 1 - i, s.length - i, s[i]);
        }
      }
    }
    return s;
  }
}
