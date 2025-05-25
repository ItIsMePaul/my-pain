class Solution {
  int countPartitions(List<int> nums) {
    int ans = 0;
    int leftSum = nums[0];
    int rightSum =
        nums.fold(0, (previousValue, element) => previousValue + element) -
            leftSum;
    for (var i = 1; i < nums.length; i++) {
      if ((leftSum - rightSum) % 2 == 0) ans++;
      leftSum += nums[i];
      rightSum -= nums[i];
    }
    return ans;
  }
}
