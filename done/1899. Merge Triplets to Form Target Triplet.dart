import 'dart:math';

class Solution {
  bool mergeTriplets(List<List<int>> triplets, List<int> target) {
    List<int> ans = [0, 0, 0];
    for (var i = 0; i < triplets.length; i++) {
      if (triplets[i][0] <= target[0] &&
          triplets[i][1] <= target[1] &&
          triplets[i][2] <= target[2]) {
        ans.replaceRange(0, 3, triplets[i]);
        triplets.removeAt(i);
        break;
      }
    }
    if (ans.toString() == target.toString()) {
      return true;
    }
    for (var i = 0; i < triplets.length; i++) {
      int max1 = max(ans[0], triplets[i][0]);
      int max2 = max(ans[1], triplets[i][1]);
      int max3 = max(ans[2], triplets[i][2]);
      if (max1 <= target[0] && max2 <= target[1] && max3 <= target[2]) {
        ans = [max1, max2, max3];
        if (ans.toString() == target.toString()) {
          return true;
        }
      }
    }
    return false;
  }
}
