class Solution {
  int countSubarrays(List<int> nums) {
    int ans = 0;
    for (var i = 0; i < nums.length - 2; i++) {
      double temp = (nums[i] + nums[i + 2]).toDouble();
      if ((temp != 0 && nums[i + 1] / temp == 2.0) ||
          (temp == 0 && nums[i + 1] == 0)) ans++;
    }
    return ans;
  }
}
