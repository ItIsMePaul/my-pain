class Solution {
  int minOperations(String s) {
    bool zero = true;
    bool one = true;
    List<int> op = [0, 0];
    for (var i = 0; i < s.length; i++) {
      if ((zero ? '0' : '1') != s[i]) op[0]++;
      if ((one ? '1' : '0') != s[i]) op[1]++;
      zero = !zero;
      one = !one;
    }
    return op[0] > op[1] ? op[1] : op[0];
  }
}
