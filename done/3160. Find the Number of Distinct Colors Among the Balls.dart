class Solution {
  List<int> queryResults(int limit, List<List<int>> queries) {
    Map<int, int> colours = {};
    Map<int, int> balls = {};
    List<int> ans = [];
    for (var query in queries) {
      if (balls.containsKey(query[0])) {
        colours[balls[query[0]]!] = colours[balls[query[0]]]! - 1;
        if (colours[balls[query[0]]] == 0) {
          colours.remove(balls[query[0]]);
        }
        balls[query[0]] = query[1];
        colours[query[1]] = (colours[query[1]] ?? 0) + 1;
      } else {
        balls[query[0]] = query[1];
        colours[query[1]] = (colours[query[1]] ?? 0) + 1;
      }
      ans.add(colours.length);
    }
    return ans;
  }
}
