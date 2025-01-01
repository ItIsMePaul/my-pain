class Solution {
  int countTime(String time) {
    if (!time.contains('?')) {
      return 0;
    }
    int ans = 1;
    if (time[4] == '?') {
      ans *= 10;
    }
    if (time[3] == '?') {
      ans *= 6;
    }
    if (time[0] == '?' && time[1] == '?') {
      ans *= 25;
    } else {
      if (time[0] == '?') {
        if (int.parse(time[1]) > 3) {
          ans *= 2;
        } else {
          ans *= 3;
        }
      }
      if (time[1] == '?') {
        ans *= 10;
      }
    }
    return ans;
  }
}
