import 'dart:collection';

class Solution {
  List<int> mostVisited(int n, List<int> rounds) {
    Map<int, int> map = {};
    for (var i = 1; i <= n; i++) map[i] = 0;
    int position = rounds[0];
    for (var i = 1; i < rounds.length; i++) {
      while(position != rounds[i]) {
        map[position] = map[position]! + 1;
        position++;
        if (position > n) position = 1;
      }
      map[position] = map[position]! + 1;
      position++;
      if (position > n) position = 1;
      print(map);
    }
    SplayTreeMap<int, List<int>> sortedMap = SplayTreeMap<int, List<int>>((a, b) => b.compareTo(a));
    for (var entry in map.entries) {
      if (!sortedMap.containsKey(entry.value)) {
        sortedMap[entry.value] = [];
      }
      sortedMap[entry.value]!.add(entry.key);
    }
    return sortedMap.entries.first.value..sort();
  }
}