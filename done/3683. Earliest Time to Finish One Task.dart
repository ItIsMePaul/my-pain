class Solution {
  int earliestTime(List<List<int>> tasks) {
    int result = 200;
    for (var i = 0; i < tasks.length; i++) {
      int temp = tasks[i][0] + tasks[i][1];
      if (temp < result) {
        result = temp;
      }
    }
    return result;
  }
}
