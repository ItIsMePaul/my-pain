class Solution {
  int maxAdjacentDistance(List<int> nums) {
    int ans = (nums.first - nums.last).abs();
    for (var i = 0; i < nums.length - 1; i++) {
      int temp = (nums[i] - nums[i + 1]).abs();
      ans = ans > temp ? ans : temp;
    }
    return ans;
  }
}
