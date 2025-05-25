class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    intervals.add(newInterval);
    intervals.sort((a, b) => a[0] - b[0]);
    List<List<int>> ans = [];
    for (var interval in intervals) {
      if (ans.isEmpty || ans.last[1] < interval[0]) {
        ans.add(interval);
      } else {
        ans.last[1] = ans.last[1] > interval[1] ? ans.last[1] : interval[1];
      }
    }
    return ans;
  }
}
