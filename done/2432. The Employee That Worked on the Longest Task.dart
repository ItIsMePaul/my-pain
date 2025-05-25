class Solution {
  int hardestWorker(int n, List<List<int>> logs) {
    int longestHours = logs[0][1];
    int bestWorker = logs[0][0];
    for (var i = 1; i < logs.length; i++) {
      int hours = logs[i][1] - logs[i - 1][1];
      if (hours >= longestHours) {
        if (hours == longestHours) {
          if (bestWorker > logs[i][0]) {
            bestWorker = logs[i][0];
            continue;
          }
        } else {
          longestHours = hours;
          bestWorker = logs[i][0];
        }
      }
    }
    return bestWorker;
  }
}
