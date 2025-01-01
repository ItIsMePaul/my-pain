class Solution {
  int hammingDistance(int x, int y) {
    String decToBin(int n) {
      String ans = '';
      while (n > 0) {
        if (n % 2 == 0) {
          ans = '0' + ans;
        } else {
          ans = '1' + ans;
        }
        n ~/= 2;
      }
      return ans;
    }

    if (x == y) return 0;
    String s1 = decToBin(x);
    String s2 = decToBin(y);
    int ans = 0;
    while (s1.length != s2.length) {
      if (s1.length > s2.length) {
        s2 = '0' + s2;
      } else {
        s1 = '0' + s1;
      }
    }
    for (var i = 0; i < s2.length; i++) {
      if (s1[i] != s2[i]) {
        ans++;
      }
    }
    return ans;
  }
}
