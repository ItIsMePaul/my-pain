class Solution {
  List<String> divideString(String s, int k, String fill) {
    List<String> ans = [];
    int stop = s.length ~/ k;
    if (s.length % k != 0) {
      stop++;
    }
    int m = 0;
    for (var i = 0; i < stop; i++) {
      String t = '';
      for (var j = 0; j < k; j++) {
        try {
          t += s[m];
        } catch (e) {
          t += fill;
        }
        m++;
      }
      ans.add(t);
    }
    return ans;
  }
}
