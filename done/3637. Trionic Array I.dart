class Solution {
  bool isTrionic(List<int> nums) {
    int switches = 0;
    bool increasing = true;
    if (nums[0] >= nums[1]) {
      return false;
    }
    for (var i = 0; i < nums.length - 1; i++) {
      if (nums[i] == nums[i + 1] || switches > 2) {
        return false;
      }
      if (increasing) {
        if (nums[i] >= nums[i + 1]) {
          increasing = false;
          switches++;
        }
      } else {
        if (nums[i] <= nums[i + 1]) {
          increasing = true;
          switches++;
        }
      }
    }
    return switches == 2;
  }
}
