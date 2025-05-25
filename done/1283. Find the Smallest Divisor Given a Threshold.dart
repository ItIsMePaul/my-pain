import 'dart:math';

class Solution {
  int smallestDivisor(List<int> nums, int threshold) {
    int left = 1;
    int right = nums.reduce(max);
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      int sum = nums.fold(
          0,
          (previousValue, currentValue) =>
              previousValue + (currentValue / mid).ceil());
      if (threshold >= sum.toInt()) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }
    return left;
  }
}
