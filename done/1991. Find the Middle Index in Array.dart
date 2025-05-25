class Solution {
  int findMiddleIndex(List<int> nums) {
    int index = -1;
    int rightSum = nums.fold(0, (previous, current) => previous + current);
    int leftSum = 0;
    for (var i = 0; i < nums.length; i++) {
      rightSum -= nums[i];
      if (rightSum == leftSum) {
        index = i;
        break;
      }
      leftSum += nums[i];
    }
    return index;
  }
}
