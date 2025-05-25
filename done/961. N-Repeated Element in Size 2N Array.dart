class Solution {
  int repeatedNTimes(List<int> nums) {
    Set<int> set = {};
    for (var i = 0; i < nums.length ~/ 2; i++) {
      if (set.contains(nums[i])) {
        return nums[i];
      } else {
        set.add(nums[i]);
      }
      if (set.contains(nums[nums.length - 1 - i])) {
        return nums[nums.length - 1 - i];
      } else {
        set.add(nums[nums.length - 1 - i]);
      }
    }
    return -1;
  }
}
