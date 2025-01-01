import 'dart:math';

class Solution {
  List<int> constructRectangle(int area) {
    int L = sqrt(area).toInt();
    int W = sqrt(area).toInt();
    while (L * W != area) {
      if (area % L == 0) {
        W = area ~/ L;
        continue;
      } else {
        L++;
      }
    }
    return [L, W];
  }
}
