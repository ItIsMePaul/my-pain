class Solution {
  int findPoisonedDuration(List<int> timeSeries, int duration) {
    List<List<int>> ans = [];
    for (var i = 0; i < timeSeries.length;) {
      int start = timeSeries[i];
      int end = start + duration - 1;
      for (var j = i + 1; j < timeSeries.length; j++) {
        if (timeSeries[j] <= end) {
          end = timeSeries[j] + duration - 1;
        } else {
          i = j;
          break;
        }
      }
      if (ans.isNotEmpty && ans.last[0] == start && ans.last[1] == end) {
        break;
      }
      ans.add([start, end]);
    }
    int fans = 0;
    for (var e in ans) {
      fans += e[1] - e[0] + 1;
    }
    return fans;
  }
}
