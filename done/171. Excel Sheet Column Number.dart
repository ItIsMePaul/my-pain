class Solution {
  int titleToNumber(String columnTitle) {
    int result = 0;
    for (var i = 0; i < columnTitle.length; i++) {
      result = (result * 26) + (columnTitle.codeUnitAt(i) - 64);
    }
    return result;
  }
}