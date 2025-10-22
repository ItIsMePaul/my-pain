class Solution {
  double averageWaitingTime(List<List<int>> customers) {
    int time = customers.first.first;
    int awaitTime = 0;
    for (var i = 0; i < customers.length; i++) {
      if (time < customers[i][0]) {
        time = customers[i][0] + customers[i][1];
      } else {
        time += customers[i][1];
      }
      awaitTime += (time - customers[i][0]);
    }
    return awaitTime / customers.length;
  }
}
