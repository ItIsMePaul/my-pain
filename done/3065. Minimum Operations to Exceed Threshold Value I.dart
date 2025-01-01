class Solution {
  int minOperations(List<int> nums, int k) {
    int ans = 0;
    for (var num in nums) if (num < k) ans++;
    return ans;
  }
}
