class Solution {
  bool isMonotonic(List<int> nums) {
    Set<int> snums = nums.toSet();
    if (snums.length == 1) {
      return true;
    }
    if (snums.elementAt(0) < snums.elementAt(1)) {
      for (var i = 0; i < nums.length - 1; i++) {
        if (!(nums[i] <= nums[i + 1] && i <= i + 1)) {
          return false;
        }
      }
    }
    if (snums.elementAt(0) > snums.elementAt(1)) {
      for (var i = 0; i < nums.length - 1; i++) {
        if (!(nums[i] >= nums[i + 1] && i <= i + 1)) {
          return false;
        }
      }
    }
    return true;
  }
}
