class Solution {
  int minSetSize(List<int> arr) {
    Map<int, int> map = {};
    for (var e in arr) map[e] = (map[e] ?? 0) + 1;
    map = Map.fromEntries(
      map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)),
    );
    int size = arr.length;
    int result = 0;
    for (var v in map.values) {
      if (size <= arr.length ~/ 2) break;
      size -= v;
      result++;
    }
    return result;
  }
}
