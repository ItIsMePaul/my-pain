class Solution {
  int maxLengthBetweenEqualCharacters(String s) {
    Map<String, List<int>> map = {};
    int distance = -1;
    for (var i = 0; i < s.length; i++) {
      if (map.containsKey(s[i])) {
        map[s[i]]!.add(i);
        if (map[s[i]]!.last - map[s[i]]!.first - 1 > distance) {
          distance = map[s[i]]!.last - map[s[i]]!.first - 1;
        }
      } else {
        map[s[i]] = [i];
      }
    }
    return distance;
  }
}
