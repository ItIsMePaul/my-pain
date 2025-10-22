class Solution {
  List<int> findLonely(List<int> nums) {
    if (nums.length < 2) {
      return nums;
    }
    nums.sort();
    List<int> result = [];
    if (nums[0] + 1 != nums[1] && nums[0] != nums[1]) {
      result.add(nums.first);
    }
    for (var i = 1; i < nums.length - 1; i++) {
      if (nums[i] - 1 != nums[i - 1] &&
          nums[i] + 1 != nums[i + 1] &&
          nums[i] != nums[i - 1] &&
          nums[i] != nums[i + 1]) {
        result.add(nums[i]);
      }
    }
    if (nums[nums.length - 1] - 1 != nums[nums.length - 2] &&
        nums[nums.length - 1] != nums[nums.length - 2]) {
      result.add(nums.last);
    }
    return result;
  }
}
