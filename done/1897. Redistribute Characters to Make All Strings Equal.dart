class Solution {
  bool makeEqual(List<String> words) {
    Map<String, int> map = {};
    for (var i = 0; i < words.length; i++) {
      for (var j = 0; j < words[i].length; j++) {
        map[words[i][j]] = (map[words[i][j]] ?? 0) + 1;
      }
    }
    for (var key in map.keys) {
      if (map[key]! % words.length != 0) {
        return false;
      }
    }
    return true;
  }
}
