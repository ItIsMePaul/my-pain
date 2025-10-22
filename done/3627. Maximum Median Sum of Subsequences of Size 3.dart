class Solution {
  int maximumMedianSum(List<int> nums) {
    nums.sort();
    int result = 0;
    for (var i = nums.length - 2; i >= nums.length ~/ 3; i -= 2) {
      result += nums[i];
    }
    return result;
  }
}
