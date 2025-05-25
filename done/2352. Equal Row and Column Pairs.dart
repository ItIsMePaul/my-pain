class Solution {
  int equalPairs(List<List<int>> grid) {
    Map<String, int> rowCount = {};
    int ans = 0;
    for (var row in grid) {
      String key = row.toString();
      rowCount[key] = (rowCount[key] ?? 0) + 1;
    }
    for (var i = 0; i < grid.length; i++) {
      List<int> col = [];
      for (var j = 0; j < grid.length; j++) {
        col.add(grid[j][i]);
      }
      ans += rowCount[col.toString()] ?? 0;
    }
    return ans;
  }
}
