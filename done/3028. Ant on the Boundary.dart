class Solution {
  int returnToBoundaryCount(List<int> nums) {
    int distance = 0;
    int ans = 0;
    for (var i = 0; i < nums.length; i++) {
      distance += nums[i];
      if (distance == 0) ans++;
    }
    return ans;
  }
}
