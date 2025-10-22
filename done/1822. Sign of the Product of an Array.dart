class Solution {
  int arraySign(List<int> nums) {
    if (nums.contains(0)) {
      return 0;
    }
    int sign = 1;
    for (var e in nums) {
      if (e < 0) {
        sign *= -1;
      }
    }
    return sign;
  }
}
