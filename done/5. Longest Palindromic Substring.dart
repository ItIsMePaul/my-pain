class Solution {
  String longestPalindrome(String s) {
    bool isPolindrome(String subString) {
      for (var i = 0; i < subString.length ~/ 2; i++) {
        if (subString[i] != subString[subString.length - i - 1]) {
          return false;
        }
      }
      return true;
    }

    String result = '';
    for (var i = s.length; i > 0; i--) {
      for (var j = 0; j + i <= s.length; j++) {
        String subString = s.substring(j, j + i);
        if (isPolindrome(subString)) {
          return subString;
        }
      }
    }
    return result;
  }
}
