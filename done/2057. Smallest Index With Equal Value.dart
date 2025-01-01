class Solution {
  int smallestEqual(List<int> nums) {
    int result = -1;
    for (var i = 0; i < nums.length; i++) {
      if (i % 10 == nums[i]) {
        return i;
      }
    }
    return result;
  }
}
