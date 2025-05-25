class Solution {
  int waysToSplitArray(List<int> nums) {
    int leftSum = 0;
    int rightSum = nums.fold(0, (sum, element) => sum + element);
    int ans = 0;
    for (var i = 0; i < nums.length - 1; i++) {
      leftSum += nums[i];
      rightSum -= nums[i];
      if (leftSum > rightSum) ans++;
    }
    return ans;
  }
}
