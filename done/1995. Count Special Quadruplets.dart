class Solution {
  int countQuadruplets(List<int> nums) {
    int ans = 0;
    for (var a = 0; a < nums.length - 3; a++) {
      for (var b = a + 1; b < nums.length - 2; b++) {
        for (var c = b + 1; c < nums.length - 1; c++) {
          for (var d = c + 1; d < nums.length; d++) {
            if (nums[a] + nums[b] + nums[c] == nums[d]) {
              ans++;
            }
          }
        }
      }
    }
    return ans;
  }
}
