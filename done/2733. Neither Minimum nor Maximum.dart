class Solution {
  int findNonMinOrMax(List<int> nums) {
    nums.sort();
    if (nums.length <= 2) {
      return -1;
    } else {
      return nums[0];
    }
  }
}
