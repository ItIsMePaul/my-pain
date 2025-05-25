class Solution {
  int countValidSelections(List<int> nums) {
    int rightSum = nums.fold(0, (previous, current) => previous + current);
    int leftSum = 0;
    int ans = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        if (rightSum == leftSum) {
          ans += 2;
          continue;
        }
        if (rightSum - 1 == leftSum || rightSum + 1 == leftSum) {
          ans++;
          continue;
        }
      } else {
        rightSum -= nums[i];
        leftSum += nums[i];
      }
      if (rightSum - leftSum < -2) return ans;
    }
    return ans;
  }
}
