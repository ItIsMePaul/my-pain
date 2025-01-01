class Solution {
  bool isPrefixString(String s, List<String> words) {
    String ans = '';
    for (var word in words) {
      ans += word;
      if (!s.contains(ans)) {
        return false;
      }
      if (s == ans) {
        return true;
      }
    }
    return false;
  }
}
