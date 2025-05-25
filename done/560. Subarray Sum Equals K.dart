class Solution {
  int subarraySum(List<int> nums, int k) {
    int result = 0;
    for (var i = 0; i < nums.length; i++) {
      int sum = 0;
      for (var j = 0; j < nums.length; j++) {
        sum += nums[j];
        if (sum == k) {
          result++;
          break;
        }
      }
    }
    return result;
  }
}
