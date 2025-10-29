class Solution {
  int pivotIndex(List<int> nums) {
    int leftSum = 0;
    int rightSum = 0;
    List<int> rightSums = List.filled(nums.length + 1, 0);
    List<int> leftSums = List.filled(nums.length + 1, 0);
    for (var i = 1; i <= nums.length; i++) {
      leftSum += nums[i - 1];
      leftSums[i] = leftSum;
      rightSum += nums[nums.length - i];
      rightSums[nums.length - i] = rightSum;
    }
    for (var i = 0; i <= leftSums.length - 2; i++) {
      if (leftSums[i] == rightSums[i + 1]) {
        return i;
      }
    }
    return -1;
  }
}
