import 'dart:collection';

class Solution {
  List<List<int>>? sortTheStudents(List<List<int>> score, int k) {
    SplayTreeMap<int, SplayTreeSet<int>> map = SplayTreeMap(
      (a, b) => b.compareTo(a),
    );
    for (var i = 0; i < score.length; i++) {
      if (!map.containsKey(score[i][k])) map[score[i][k]] = SplayTreeSet();
      map[score[i][k]]!.add(i);
    }
    List<List<int>> result = [];
    for (var key in map.keys) {
      for (var pos in map[key]!) {
        result.add(score[pos]);
      }
    }
    return result;
  }
}
