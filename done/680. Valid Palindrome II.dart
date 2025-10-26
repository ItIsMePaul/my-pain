class Solution {
  bool validPalindrome(String s) {
    bool isPolindrome(String str) {
      int length = str.length ~/ 2 > 2 ? 2 : str.length ~/ 2;
      for (var i = 0; i <= length; i++) {
        if (str[i] != str[str.length - 1 - i]) return false;
      }
      return true;
    }

    if (s.length < 2) return true;
    bool deleted = false;
    int right = s.length - 1;
    for (var i = 0; i < s.length ~/ 2; i++) {
      if (s[i] != s[right]) {
        if (deleted) return false;
        deleted = true;
        if (isPolindrome(s.substring(i + 1, right + 1))) {
          continue;
        } else if (isPolindrome(s.substring(i, right))) {
          right--;
        } else {
          return false;
        }
      }
      right--;
    }
    return true;
  }
}
