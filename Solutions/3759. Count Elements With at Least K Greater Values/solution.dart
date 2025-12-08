import 'dart:collection';

class Solution {
  int countElements(List<int> nums, int k) {
    if (k == 0) return nums.length;
    int sum = 0;
    int result = 0;
    Map<int, int> sumMap = {};
    SplayTreeMap<int, int> map = SplayTreeMap();
    for (var i = 0; i < nums.length; i++) {
      map[nums[i]] = (map[nums[i]] ?? 0) + 1;
    }
    List<int> keys = map.keys.toList();
    for (var i = keys.length - 1; i >= 0; i--) {
      sumMap[keys[i]] = sum;
      sum += map[keys[i]]!;
    }
    for (var i = 0; i < keys.length; i++) {
      if (sumMap[keys[i]]! >= k) {
        result += map[keys[i]]!;
      } else {
        break;
      }
    }
    return result;
  }
}
