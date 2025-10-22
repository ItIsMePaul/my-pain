class Solution {
  int smallestRangeI(List<int> nums, int k) {
    int max = 0;
    int min = 10000;
    for (var num in nums) {
      if (num > max) max = num;
      if (num < min) min = num;
    }
    return max - min - 2 * k > 0 ? max - min - 2 * k : 0;
  }
}
