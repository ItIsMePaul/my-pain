class Solution {
  List<int> findingUsersActiveMinutes(List<List<int>> logs, int k) {
    Map<int, Set<int>> map = {};
    for (var log in logs) {
      if (!map.containsKey(log[0])) map[log[0]] = {};
      map[log[0]]!.add(log[1]);
    }
    List<int> result = List.filled(k, 0);
    for (var key in map.keys) {
      result[map[key]!.length - 1]++;
    }
    return result;
  }
}
