import 'dart:math';

class Solution {
  int maxAlternatingSum(List<int> nums) {
    nums.sort((a, b) => a.abs().compareTo(b.abs()));
    int sum = 0;
    for (var i = 0; i < nums.length ~/ 2; i++) {
      sum +=
          pow(nums[nums.length - 1 - i], 2).toInt() - pow(nums[i], 2).toInt();
    }
    if (nums.length % 2 == 1) {
      sum += pow(nums[nums.length ~/ 2], 2).toInt();
    }
    return sum;
  }
}
