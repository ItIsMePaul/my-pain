class Solution {
  int countPairsII(List<int> nums, int k) {
    int result = 0;
    for (var i = 0; i < nums.length - 1; i++) {
      for (var j = i + 1; j < nums.length; j++) {
        if (nums[i] == nums[j] && i * j % k == 0) {
          result++;
        }
      }
    }
    return result;
  }
}
