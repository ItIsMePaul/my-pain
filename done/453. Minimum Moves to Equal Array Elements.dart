class Solution {
  int minMoves(List<int> nums) {
    int min = nums.first;
    int res = 0;
    for (var num in nums) if (num < min) min = num;
    for (var num in nums) res += num - min;
    return res;
  }
}
