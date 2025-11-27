class Solution {
  int longestMonotonicSubarray(List<int> nums) {
    int ans = 1;
    int tempd = 1;
    int tempi = 1;
    for (var i = 0; i < nums.length - 1; i++) {
      if (nums[i] > nums[i + 1]) {
        tempd++;
      } else {
        if (tempd > ans) ans = tempd;
        tempd = 1;
      }
      if (nums[i] < nums[i + 1]) {
        tempi++;
      } else {
        if (tempi > ans) ans = tempi;
        tempi = 1;
      }
    }
    if (tempi > ans || tempd > ans) {
      ans = tempi >= tempd ? tempi : tempd;
    }

    return ans;
  }
}
