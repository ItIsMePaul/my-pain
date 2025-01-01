class Solution {
  int minDeletionSize(List<String> strs) {
    if (strs[0].length == 1) {
      return 0;
    }
    int ans = 0;
    for (var i = 0; i < strs[0].length; i++) {
      for (var j = 0; j < strs.length - 1; j++) {
        if (strs[j][i].codeUnits[0] > strs[j + 1][i].codeUnits[0]) {
          ans++;
          break;
        }
      }
    }
    return ans;
  }
}
