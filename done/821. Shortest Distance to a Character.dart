class Solution {
  List<int> shortestToChar(String s, String c) {
    List<int> ans = [];
    for (var i = 0; i < s.length; i++) {
      int temp1 = 0;
      int temp2 = 0;
      for (var j = i; j < s.length; j++) {
        if (c == s[j]) {
          temp1 = j - i;
          break;
        }
      }
      for (var j = i; j >= 0; j--) {
        if (c == s[j]) {
          temp2 = i - j;
          break;
        }
      }
      ans.add(temp2 > temp1 ? temp1 : temp2);
    }
    return ans;
  }
}
