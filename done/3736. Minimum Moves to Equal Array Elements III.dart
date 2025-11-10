class Solution {
  int minMoves(List<int> nums) {
    int max = nums.first;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] > max) max = nums[i];
    }
    int result = 0;
    for (var i = 0; i < nums[i]; i++) {
      result += max - nums[i];
    }
    return result;
  }
}
