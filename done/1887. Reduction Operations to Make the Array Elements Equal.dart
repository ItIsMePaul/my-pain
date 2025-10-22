class Solution {
  int reductionOperations(List<int> nums) {
    nums.sort();
    int index = 0;
    int result = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[index] != nums[i]) {
        result += nums.length - i;
        index = i;
      }
    }
    return result;
  }
}
