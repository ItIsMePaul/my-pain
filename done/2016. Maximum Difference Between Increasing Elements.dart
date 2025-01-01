class Solution {
  int maximumDifference(List<int> nums) {
    int result = -1;
    for (var i = 0; i < nums.length - 1; i++) {
      for (var j = i + 1; j < nums.length; j++) {
        if (nums[i] < nums[j] && result < nums[j] - nums[i]) {
          result = nums[j] - nums[i];
        }
      }
    }
    return result;
  }
}
