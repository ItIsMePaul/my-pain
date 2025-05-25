class Solution {
  int findClosestNumber(List<int> nums) {
    int distance = nums.first.abs();
    int pos = 0;
    for (var i = 1; i < nums.length; i++) {
      if (distance >= nums[i].abs()) {
        if (distance != nums[i].abs()) {
          distance = nums[i].abs();
          pos = i;
        } else {
          if (nums[i] > nums[pos]) {
            pos = i;
          }
        }
      }
    }
    return nums[pos];
  }
}
