import 'dart:collection';

class Solution {
  int minOperations(List<int> nums, int k) {
    SplayTreeSet<int> set = SplayTreeSet();
    set.addAll(nums);
    if (set.first < k) return -1;
    if (set.length == 1 && set.first == k) return 0;
    return set.length - (set.first == k ? 1 : 0);
  }
}
