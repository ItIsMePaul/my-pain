class Solution {
  int countHillValley(List<int> nums) {
    for (var i = 0; i < nums.length - 1; i++) {
      if (nums[i] == nums[i + 1]) {
        nums.removeAt(i + 1);
        i--;
      }
    }
    int result = 0;
    for (var i = 1; i < nums.length - 1; i++) {
      if ((nums[i - 1] > nums[i] && nums[i] < nums[i + 1]) ||
          (nums[i - 1] < nums[i] && nums[i] > nums[i + 1])) {
        result++;
      }
    }
    return result;
  }
}
