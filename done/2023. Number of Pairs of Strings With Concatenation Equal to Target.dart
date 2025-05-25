class Solution {
  int numOfPairs(List<String> nums, String target) {
    int result = 0;
    for (var i = 0; i < nums.length; i++) {
      for (var j = 0; j < nums.length; j++) {
        if (i == j) continue;
        if (nums[i] + nums[j] == target) result++;
      }
    }
    return result;
  }
}
