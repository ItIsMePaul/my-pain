class Solution {
  int maxSumDistinctTriplet(List<int> x, List<int> y) {
    Map<int, int> map = {};
    for (var i = 0; i < x.length; i++) {
      if (map.containsKey(x[i])) {
        if (map[x[i]]! < y[i]) map[x[i]] = y[i];
      } else {
        map[x[i]] = y[i];
      }
    }
    if (map.length < 3) return -1;
    int result = 0;
    map = Map.fromEntries(
      map.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)),
    );
    result = map.values
        .toList()
        .sublist(map.length - 3)
        .fold(0, (p, e) => p + e);
    return result;
  }
}
