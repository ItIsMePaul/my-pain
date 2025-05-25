import 'dart:collection';

class Solution {
  List<int> findXSum(List<int> nums, int k, int x) {
    int sum(Map<int, int> m) {
      int result = 0;
      SplayTreeMap<int, List<int>> temp = SplayTreeMap();
      for (var key in m.keys) {
        if (temp.containsKey(m[key])) {
          temp[m[key]]!.add(key);
        } else {
          temp[m[key]!] = [key];
        }
      }
      int added = 1;
      List<int> keys = temp.keys.toList();
      for (var key in keys.reversed) {
        for (var value in temp[key]!.reversed) {
          result += value * key;
          if (added == x) return result;
        }
      }
      return result;
    }

    SplayTreeMap<int, int> map = SplayTreeMap();
    for (var i = 0; i < k; i++) {
      map[nums[i]] = (map[nums[i]] ?? 0) + 1;
    }
    List<int> result = [];
    result.add(sum(map));
    for (var i = 1; i + k < nums.length; i++) {
      map[nums[i - 1]] = map[nums[i - 1]]! - 1;
      map[nums[i + k]] = (map[nums[i + k]] ?? 0) + 1;
      result.add(sum(map));
    }
    return result;
  }
}
