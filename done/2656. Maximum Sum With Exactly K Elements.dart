class Solution {
  int maximizeSum(List<int> nums, int k) {
    nums.sort();
    int ans = 0;
    for (var i = 0; i < k; i++) ans += nums.last++;
    return ans;
  }
}
