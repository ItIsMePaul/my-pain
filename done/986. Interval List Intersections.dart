import 'dart:math';

class Solution {
  List<List<int>>? intervalIntersection(
    List<List<int>> fl,
    List<List<int>> sl,
  ) {
    if (fl.isEmpty || sl.isEmpty) return [];

    List<int>? findOverlap(List<int> f, List<int> s) {
      int front = max(f[0], s[0]);
      int end = min(f[1], s[1]);
      if (front <= end) {
        return [front, end];
      } else {
        return null;
      }
    }

    List<List<int>> result = [];
    for (var f in fl) {
      for (var s in sl) {
        List<int>? res = findOverlap(f, s);
        if (res != null) {
          result.add(res);
        } else {
          continue;
        }
      }
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  List<List<int>> firstList = [
    [0, 2],
    [5, 10],
    [13, 23],
    [24, 25],
  ];
  List<List<int>> secondList = [
    [1, 5],
    [8, 12],
    [15, 24],
    [25, 26],
  ];
  print(solution.intervalIntersection(firstList, secondList));
}
