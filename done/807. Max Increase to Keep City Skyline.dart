import 'dart:math';

class Solution {
  int maxIncreaseKeepingSkyline(List<List<int>> grid) {
    int ans = 0;
    List<int> maxInColumns = [];
    List<int> maxInRows = [];
    for (var i = 0; i < grid.length; i++) {
      int tempMaxColumn = 0;
      int tempMaxRow = 0;
      for (var j = 0; j < grid.length; j++) {
        tempMaxColumn = max(tempMaxColumn, grid[j][i]);
        tempMaxRow = max(tempMaxRow, grid[i][j]);
      }
      maxInColumns.add(tempMaxColumn);
      maxInRows.add(tempMaxRow);
    }
    for (var i = 0; i < grid.length; i++) {
      for (var j = 0; j < grid.length; j++) {
        ans += min(maxInRows[i], maxInColumns[j]) - grid[i][j];
      }
    }
    return ans;
  }
}
