class Solution {
  int arithmeticTriplets(List<int> nums, int diff) {
    int ans = 0;
    for (var i = 0; i < nums.length - 2; i++) {
      for (var j = i + 1; j < nums.length - 1; j++) {
        for (var k = j + 1; k < nums.length; k++) {
          if (nums[j] - nums[i] == diff && nums[k] - nums[j] == diff) {
            ans++;
          }
        }
      }
    }
    return ans;
  }
}
