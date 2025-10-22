import 'dart:collection';

class Solution {
  List<String> topKFrequent(List<String> words, int k) {
    Map<String, int> map = {};
    for (var word in words) {
      map[word] = (map[word] ?? 0) + 1;
    }
    SplayTreeMap<int, SplayTreeSet<String>> frequentMap = SplayTreeMap(
      (a, b) => b.compareTo(a),
    );
    for (var key in map.keys) {
      if (!frequentMap.containsKey(map[key])) {
        frequentMap[map[key]!] = SplayTreeSet();
      }
      frequentMap[map[key]]!.add(key);
    }
    List<String> result = [];
    for (var key in frequentMap.keys) {
      for (var word in frequentMap[key]!) {
        result.add(word);
        k--;
        if (k == 0) return result;
      }
    }
    return result;
  }
}
