import 'dart:collection';

class Solution {
  String findCommonResponse(List<List<String>> responses) {
    SplayTreeMap<String, int> map = SplayTreeMap();
    for (var list in responses) {
      for (var response in list.toSet()) {
        map[response] = (map[response] ?? 0) + 1;
      }
    }
    int max = 0;
    String mostCommon = '';
    for (var key in map.keys) {
      if (map[key]! > max) {
        max = map[key]!;
        mostCommon = key;
      }
    }
    return mostCommon;
  }
}
