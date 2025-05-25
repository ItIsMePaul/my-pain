class Solution {
  int longestPalindrome(String s) {
    Map<String, int> map = {};
    for (var i = 0; i < s.length; i++) {
      map[s[i]] == null ? map[s[i]] = 1 : map[s[i]] = map[s[i]]! + 1;
    }
    bool containOddNumber = false;
    int ans = 0;
    for (var key in map.keys) {
      if (map[key]! % 2 == 0) {
        ans += map[key]!;
      } else {
        containOddNumber = true;
        ans += (map[key]! - 1);
      }
    }
    if (containOddNumber) ans++;
    return ans;
  }
}
