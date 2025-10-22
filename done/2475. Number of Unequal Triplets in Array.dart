class Solution {
  int unequalTriplets(List<int> nums) {
    int counter = 0;
    for (var i = 0; i < nums.length; i++) {
      for (var j = i + 1; j < nums.length; j++) {
        for (var k = j + 1; k < nums.length; k++) {
          if (nums[i] != nums[j] && nums[j] != nums[k] && nums[k] != nums[i]) {
            counter++;
          }
        }
      }
    }
    return counter;
  }
}
