class Solution {
  double findMaxAverage(List<int> nums, int k) {
    int sum = nums.sublist(0, k).fold(0, (p, e) => p + e);
    double maximumAvetage = sum / k;
    for (var i = k; i < nums.length; i++) {
      sum = sum - nums[i - k] + nums[i];
      if (sum / k > maximumAvetage) {
        maximumAvetage = sum / k;
      }
    }
    return maximumAvetage;
  }
}
