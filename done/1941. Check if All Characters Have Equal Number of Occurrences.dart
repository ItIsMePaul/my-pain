class Solution {
  bool areOccurrencesEqual(String s) {
    Map<String, int> map = {};
    for (var e in s.split('')) {
      if (map.containsKey(e)) {
        map[e] = map[e]! + 1;
      } else {
        map[e] = 1;
      }
    }
    List<int>? temp = List.from(map.values);
    for (var i = 0; i < temp.length; i++) {
      if (temp[0] != temp[i]) {
        return false;
      }
    }
    return true;
  }
}
