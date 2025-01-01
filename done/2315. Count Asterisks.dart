class Solution {
  int countAsterisks(String s) {
    bool mSwitch = true;
    int ans = 0;
    for (var i = 0; i < s.length; i++) {
      if (mSwitch) {
        if (s[i] == '|') {
          mSwitch = !mSwitch;
          continue;
        }
        if (s[i] == '*') {
          ans++;
        }
      } else {
        if (s[i] == '|') {
          mSwitch = !mSwitch;
          continue;
        }
      }
    }
    return ans;
  }
}
