class Solution {
  int missingInteger(List<int> nums) {
    int ans = nums[0];
    for (var i = 0; i < nums.length - 1; i++) {
      if (nums[i] + 1 == nums[i + 1])
        ans += nums[i + 1];
      else
        break;
    }
    while (nums.contains(ans)) {
      ans++;
    }
    return ans;
  }
}
