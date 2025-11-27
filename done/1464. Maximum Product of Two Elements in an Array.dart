class Solution {
  int maxProduct(List<int> nums) {
    nums.sort();
    return ((nums[nums.length - 1] - 1) * (nums[nums.length - 2] - 1));
  }
}
