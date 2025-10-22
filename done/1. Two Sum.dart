class Solution {
  List<int>? twoSum(List<int> nums, int target) {
    for (var i = 0; i < nums.length; i++) {
      for (var j = i + 1; j < nums.length; j++) {
        if (target == nums[i] + nums[j]) {
          return [i, j];
        }
      }
    }
    return null;
  }

  List<int> twoSumBetterVersion(List<int> nums, int target) {
    List<int> result = [];
    Set<int> seen = {};
    for (var i = 0; i < nums.length; i++) {
      if (seen.contains(target - nums[i])) {
        result = [nums.indexOf(target - nums[i]), i];
        break;
      } else {
        seen.add(nums[i]);
      }
    }
    return result;
  }
}
