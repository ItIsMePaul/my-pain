class Solution {
  int countKeyChanges(String s) {
    String temp = s.toLowerCase();
    int result = 0;
    for (var i = 0; i < temp.length - 1; i++) {
      if (temp[i] != temp[i + 1]) {
        result++;
      }
    }
    return result;
  }
}
