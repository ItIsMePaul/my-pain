class Solution {
  List<int> getConcatenation(List<int> nums) {
    List<int> tmp = [];
    for (var i = 0; i < nums.length; i++) {
      tmp.add(nums[i]);
    }
    for (var i = 0; i < nums.length; i++) {
      tmp.add(nums[i]);
    }
    return nums;
  }
}
