class Solution {
  List<int> smallerNumbersThanCurrent(List<int> nums) {
    List<int> result = [];
    for (var i = 0; i < nums.length; i++) {
      result.add(0);
      for (var j = 0; j < nums.length; j++) {
        if (nums[i] > nums[j]) {
          result[i]++;
        }
      }
    }
    return result;
  }
}
