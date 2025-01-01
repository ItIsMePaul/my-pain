class Solution {
  int numTimesAllBlue(List<int> flips) {
    int maxFlipped = 0;
    int ans = 0;
    for (var i = 0; i < flips.length; i++) {
      maxFlipped = maxFlipped > flips[i] ? maxFlipped : flips[i];
      if (maxFlipped == i + 1) {
        ans++;
      }
    }
    return ans;
  }
}
