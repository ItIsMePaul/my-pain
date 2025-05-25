import 'dart:math';

class Solution {
  int minEatingSpeed(List<int> piles, int h) {
    int left = 1;
    int right = piles.reduce(max);
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      int hoursNeeded = piles.fold(0,
          (previousValue, element) => previousValue + (element / mid).ceil());
      if (hoursNeeded <= h) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }
    return left;
  }
}
