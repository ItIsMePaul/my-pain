class Solution {
  String restoreString(String s, List<int> indices) {
    Map<int, String> word = {};
    for (var i = 0; i < s.length; i++) {
      word[indices[i]] = s[i];
    }
    String result = '';
    for (var i = 0; i < word.length; i++) {
      result += word[i]!;
    }
    return result;
  }
}
