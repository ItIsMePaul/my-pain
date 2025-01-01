import 'dart:math';

class Solution {
  int pickGifts(List<int> gifts, int k) {
    int maxIndex(List<int> arr) {
      int ans = 0;
      for (var i = 0; i < arr.length; i++) ans = arr[i] > arr[ans] ? i : ans;
      return ans;
    }

    for (var i = 0; i < k; i++) {
      int index = maxIndex(gifts);
      gifts[index] = sqrt(gifts[index]).toInt();
    }
    int ans = 0;
    for (var gift in gifts) ans += gift;

    return ans;
  }
}
