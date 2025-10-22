class Solution {
  int getLeastFrequentDigit(int n) {
    Map<int, int> map = {};
    for (var s in n.toString().split('')) {
      int temp = int.parse(s);
      map[temp] = (map[temp] ?? 0) + 1;
    }
    int result = map.keys.first;
    for (var key in map.keys) {
      if (map[key]! < map[result]! ||
          (map[key]! <= map[result]! && key < result)) {
        result = key;
      }
    }
    return result;
  }
}
