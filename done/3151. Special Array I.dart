class Solution {
  bool isArraySpecial(List<int> nums) {
    if (nums.length == 1) return true;

    for (var i = 0; i < nums.length - 1; i++) {
      if (nums[i] % 2 == nums[i + 1] % 2) {
        return false;
      }
    }
    return true;
  }
}
