class Solution {
  List<int> minSubsequence(List<int> nums) {
    int sum = nums.fold(0, (p, c) => p + c);
    nums.sort();
    int currentSum = 0;
    List<int> result = [];
    for (var i = nums.length - 1; i >= 0; i--) {
      sum -= nums[i];
      currentSum += nums[i];
      result.add(nums[i]);
      if (currentSum > sum) {
        return result;
      }
    }
    return result;
  }
}
