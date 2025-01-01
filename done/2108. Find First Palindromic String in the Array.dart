class Solution {
  String firstPalindrome(List<String> words) {
    bool isPalindrome(String s) {
      for (var i = 0; i < s.length ~/ 2; i++) {
        if (s[i] != s[s.length - 1 - i]) {
          return false;
        }
      }
      return true;
    }

    for (var word in words) if (isPalindrome(word)) return word;

    return '';
  }
}
