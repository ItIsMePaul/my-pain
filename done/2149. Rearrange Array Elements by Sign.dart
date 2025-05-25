import 'dart:collection';

class Solution {
  List<int> rearrangeArray(List<int> nums) {
    Queue<int> result = Queue();
    int positivePoint = 0;
    int negativePoint = 0;
    while (result.length != nums.length) {
      for (var i = positivePoint; i < nums.length; i++) {
        if (nums[i] > 0) {
          result.add(nums[i]);
          positivePoint = i + 1;
          break;
        }
      }
      for (var i = negativePoint; i < nums.length; i++) {
        if (nums[i] < 0) {
          result.add(nums[i]);
          negativePoint = i + 1;
          break;
        }
      }
    }
    return result.toList();
  }
}
