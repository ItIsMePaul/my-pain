class Solution {
  List<int> intersectionII(List<List<int>> nums) {
    if (nums.length < 2) {
      nums[0].sort();
      return nums[0];
    }
    List<int> result = [];
    for (var i = 0; i < nums[0].length; i++) {
      bool isContain = true;
      for (var j = 1; j < nums.length; j++) {
        if (!nums[j].contains(nums[0][i])) {
          isContain = false;
          break;
        }
      }
      if (isContain) result.add(nums[0][i]);
    }
    result.sort();
    return result;
  }
}
