class Solution {
  bool hasIncreasingSubarrays(List<int> nums, int k) {
    bool isIncreasing(List<int> nums) {
      for (var i = 0; i < nums.length - 1; i++) {
        if (nums[i] >= nums[i + 1]) {
          return false;
        }
      }
      return true;
    }

    if (k == 1) {
      return true;
    }

    bool first = false;
    bool second = false;
    for (var i = 0; i < nums.length - k + 1; i++) {
      List<int> temp1 = nums.sublist(i, i + k);
      if (!first && isIncreasing(temp1)) {
        first = true;
      } else {
        continue;
      }
      if (i + k + k > nums.length) break;

      List<int> temp2 = nums.sublist(i + k, i + k + k);
      if (!second && isIncreasing(temp2)) {
        second = true;
        break;
      } else {
        first = false;
      }
    }
    if (first && second) {
      return true;
    }
    return false;
  }
}
