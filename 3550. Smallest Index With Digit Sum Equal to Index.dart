class Solution {
  int smallestIndex(List<int> nums) {
    for (var i = 0; i < nums.length; i++) {
      int sumOfDigits = 0;
      for (var j = nums[i]; j > 0; j = (j / 10).floor()) {
        sumOfDigits += (j % 10);
      }
      if (i == sumOfDigits) {
        return i;
      }
    }
    return -1;
  }
}
