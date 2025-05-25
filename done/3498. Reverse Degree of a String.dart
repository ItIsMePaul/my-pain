class Solution {
  int reverseDegree(String s) {
    int result = 0;
    for (var i = 0; i < s.length; i++)
      result += (s[i].codeUnits[0] - 97 - 26).abs() * (i + 1);
    return result;
  }
}
