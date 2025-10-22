class Solution {
  int minOperations(List<int> nums) {
    return nums.toSet().length == 1 ? 0 : 1;
  }
}
