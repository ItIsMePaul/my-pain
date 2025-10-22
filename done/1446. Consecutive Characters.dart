class Solution {
  int maxPower(String s) {
    int max = 0;
    int c = 0;
    String chr = s[0];
    for (var i = 0; i < s.length; i++) {
      if (s[i] == chr) {
        c++;
      } else {
        if (c > max) {
          max = c;
        }
        c = 1;
        chr = s[i];
      }
    }
    return max;
  }
}
