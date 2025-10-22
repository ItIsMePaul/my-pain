class Solution {
  int balancedStringSplit(String s) {
    int cr = 0;
    int cl = 0;
    int fr = 0;
    for (var i = 0; i < s.length; i++) {
      if (s[i] == 'R') cr++;
      if (s[i] == 'L') cl++;
      if (cr == cl) {
        fr++;
        cl = 0;
        cr = 0;
      }
    }
    return fr;
  }
}
