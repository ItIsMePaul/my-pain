class Solution {
  int minimumOperations(List<int> nums) {
    int ans = 0;
    for (var i = nums.length - 1; i > 0; i--) {
      if (nums[i] < nums[i - 1]) {
        ans++;
        nums.removeAt(i);
        print(nums);
      }
    }
    return ans;
  }
}
