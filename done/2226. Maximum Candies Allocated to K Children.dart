import 'dart:math';

class Solution {
  int maximumCandies(List<int> candies, int k) {
    int totalCandies = candies.fold(
        0, (previousValue, currentValue) => previousValue + currentValue);
    if (totalCandies < k) return 0;
    if (totalCandies == k) return 1;
    int left = 1;
    int ans = 0;
    int right = candies.reduce(max);
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      int temp =
          candies.fold(0, (previous, element) => previous + (element ~/ mid));
      if (temp >= k) {
        ans = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return ans;
  }
}
