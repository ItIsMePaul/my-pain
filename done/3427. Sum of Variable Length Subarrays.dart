import 'dart:math';

class Solution {
  int subarraySum(List<int> nums) {
    int ans = 0;
    List<int> prefixSum = [nums[0]];
    for (var i = 1; i < nums.length; i++) {
      prefixSum.add(prefixSum[i - 1] + nums[i]);
    }
    for (var i = 0; i < nums.length; i++) {
      int start = max(0, i - nums[i]);
      int end = i;
      if (start == 0) {
        ans += prefixSum[end];
      } else {
        ans += (prefixSum[end] - prefixSum[start - 1]);
      }
    }
    return ans;
  }
}
