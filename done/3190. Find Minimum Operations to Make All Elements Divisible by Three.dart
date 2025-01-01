class Solution {
  int minimumOperations(List<int> nums) {
    int ans = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] % 3 == 0) {
        continue;
      } else {
        ans++;
      }
    }
    return ans;
  }
}
