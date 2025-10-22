import 'dart:collection';

class Solution {
  int maxKelements(List<int> nums, int k) {
    SplayTreeMap<int, int> map = SplayTreeMap((a, b) => b.compareTo(a));
    int score = 0;
    for (var i = 0; i < nums.length; i++) map[nums[i]] = (map[nums[i]] ?? 0) + 1;
    while (0 < k--) {
      int firstKey = map.firstKey()!;
      score += firstKey;
      map[firstKey] = map[firstKey]! - 1;
      if (map[firstKey] == 0) map.remove(firstKey);
      map[(firstKey / 3).ceil()] = (map[(firstKey / 3).ceil()] ?? 0) + 1;
    }
    return score;
  }
}