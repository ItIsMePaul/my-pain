class Solution {
  int minimumRounds(List<int> tasks) {
    Map<int, int> map = {};
    int rounds = 0;
    for (var task in tasks) map[task] = (map[task] ?? 0) + 1;
    for (var key in map.keys) {
      if (map[key] == 1) return -1;
      if (map[key] == 2) {
        rounds++;
        continue;
      }
      if (map[key]! % 3 == 0) {
        rounds += map[key]! ~/ 3;
        continue;
      }
      if (map[key]! % 3 == 1) {
        map[key] = map[key]! - 4;
        rounds += 2 + map[key]! ~/ 3;
        continue;
      }
      if (map[key]! % 3 == 2) {
        map[key] = map[key]! - 2;
        rounds += 1 + map[key]! ~/ 3;
        continue;
      }
    }
    return rounds;
  }
}