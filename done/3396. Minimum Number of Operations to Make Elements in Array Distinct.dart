class Solution {
  int minimumOperations(List<int> nums) {
    int ans = 0;
    while (nums.length != nums.toSet().length) {
      int sizeToRemove = nums.length > 2 ? 3 : nums.length;
      nums.removeRange(0, sizeToRemove);
      ans++;
    }
    return ans;
  }
}
