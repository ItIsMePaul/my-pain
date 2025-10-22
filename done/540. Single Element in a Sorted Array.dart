class Solution {
  int singleNonDuplicate(List<int> nums) {
    for (var i = 0; i < nums.length; i += 2) {
      if (nums[i] != nums[i + 1]) {
        return nums[i];
      }
    }
    return nums.last;
  }
}
