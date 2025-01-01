class Solution {
  int findFinalValue(List<int> nums, int original) {
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == original) {
        original *= 2;
        i = -1;
      }
    }
    return original;
  }
}
