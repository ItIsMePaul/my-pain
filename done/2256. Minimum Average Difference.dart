class Solution {
  int minimumAverageDifference(List<int> nums) {
    if (nums.length == 1) return 0;
    int leftSum = 0;
    int rightSum = nums.fold(0, (sum, element) => sum + element);
    int minDifference = 100001;
    int ans = 0;

    for (var i = 0; i < nums.length; i++) {
      leftSum += nums[i];
      rightSum -= nums[i];
      int temp = 0;
      if (nums.length - i - 1 == 0) {
        temp = (leftSum ~/ (i + 1)).abs();
      } else {
        temp = (leftSum ~/ (i + 1) - rightSum ~/ (nums.length - i - 1)).abs();
      }
      if (minDifference > temp) {
        minDifference = temp;
        ans = i;
      }
    }
    return ans;
  }
}
