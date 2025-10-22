class Solution {
  List<List<int>> largeGroupPositions(String s) {
    int c = 0;
    int fp = 0, lp = 0;
    String ml = s[0];
    List<List<int>> result = [];
    for (var i = 0; i < s.length; i++) {
      if (ml != s[i] || i == s.length - 1) {
        if (i == s.length - 1 && c >= 2 && ml == s[i]) {
          lp = i;
          result.add([fp, lp]);
          continue;
        }
        ml = s[i];
        if (c >= 3) {
          lp = i - 1;
          result.add([fp, lp]);
          fp = i;
          c = 1;
          continue;
        }
        fp = i;
        c = 1;
        continue;
      }
      c++;
    }
    return result;
  }
}
