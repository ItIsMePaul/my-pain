class Solution {
  List<List<int>> groupThePeople(List<int> groupSizes) {
    Map<int, List<int>> map = {};
    List<List<int>> ans = [];
    for (var i = 0; i < groupSizes.length; i++) {
      if (map.containsKey(groupSizes[i])) {
        map[groupSizes[i]]!.add(i);
      } else {
        map[groupSizes[i]] = [i];
      }
    }
    for (var key in map.keys) {
      for (var i = 0; i < map[key]!.length ~/ key; i++) {
        ans.add(map[key]!.sublist(i * key, i * key + key));
      }
    }
    return ans;
  }
}
