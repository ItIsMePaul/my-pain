class Solution {
  int alternatingSum(List<int> nums) {
    int evenSum = 0;
    int oddSum = 0;
    for (int i = 0; i < nums.length; i++) {
      if (i % 2 == 0) {
        evenSum += nums[i];
      } else {
        oddSum += nums[i];
      }
    }
    return evenSum - oddSum;
  }
}
