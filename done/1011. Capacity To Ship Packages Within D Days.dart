class Solution {
  int shipWithinDays(List<int> weights, int days) {
    int left = 1;
    int right =
        weights.fold(0, (previousValue, element) => previousValue + element);

    main:
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      int daysNeeded = 0;
      int weight = 0;
      for (var i = 0; i < weights.length; i++) {
        if (weights[i] > mid) {
          left = mid + 1;
          continue main;
        }
        if (weight + weights[i] > mid) {
          daysNeeded++;
          weight = weights[i];
        } else {
          weight += weights[i];
        }
      }
      if (daysNeeded + 1 <= days) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }
    return left;
  }
}
