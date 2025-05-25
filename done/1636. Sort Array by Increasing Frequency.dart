class Solution {
  List<int> frequencySort(List<int> nums) {
    Map<int, int> map = {};
    for (var e in nums) {
      map[e] = (map[e] ?? 0) + 1;
    }
    Map<int, List<int>> temp = {};
    for (var key in map.keys) {
      if (temp.containsKey(map[key])) {
        temp[map[key]!]!.add(key);
      } else {
        temp[map[key]!] = [key];
      }
    }
    List<int> result = [];
    for (var key in temp.keys.toList()..sort()) {
      for (var j in temp[key]!..sort((a, b) => a.compareTo(b))) {
        for (var i = 0; i < key; i++) {
          result.add(j);
        }
      }
    }
    return result;
  }
}
