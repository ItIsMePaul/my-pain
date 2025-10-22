class Solution {
  int maximumPossibleSize(List<int> nums) {
    List<int> stack = [nums[0]];
    for (var i = 1; i < nums.length; i++) {
      if (stack.last <= nums[i]) stack.add(nums[i]);
    }
    return stack.length;
  }
}
