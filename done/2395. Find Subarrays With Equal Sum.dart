class Solution {
  bool findSubarrays(List<int> nums) {
    Map<int, int> subArraySum = {};
    for (var i = 0; i < nums.length - 1; i++) {
      int temp = nums[i] + nums[i + 1];
      subArraySum[temp] = (subArraySum[temp] ?? 0) + 1;
      if (subArraySum[temp]! > 1) {
        return true;
      }
    }
    return false;
  }
}
