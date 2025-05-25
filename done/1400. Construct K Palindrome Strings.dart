class Solution {
  bool canConstruct(String s, int k) {
    if (s.length < k) return false;
    if (s.length == k) return true;
    Map<String, int> map = {};
    for (var char in s.split('')) {
      if (map.containsKey(char)) {
        map[char] = map[char]! + 1;
      } else {
        map[char] = 1;
      }
    }
    int odd = 0;
    for (var num in map.values) {
      if (num.isOdd) {
        odd++;
      }
    }
    return odd <= k;
  }
}
