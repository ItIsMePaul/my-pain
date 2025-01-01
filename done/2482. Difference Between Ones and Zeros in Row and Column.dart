class Solution {
  List<List<int>> onesMinusZeros(List<List<int>> grid) {
    List<List<int>> ans = [];
    List<int> column = [];
    List<int> row = [];
    for (var i = 0; i < grid[0].length; i++) {
      int temp = 0;
      for (var c = 0; c < grid.length; c++) {
        grid[c][i] == 1 ? temp++ : temp--;
      }
      column.add(temp);
    }
    for (var i = 0; i < grid.length; i++) {
      int temp = 0;
      for (var r = 0; r < grid[i].length; r++) {
        grid[i][r] == 1 ? temp++ : temp--;
      }
      row.add(temp);
    }

    for (var i = 0; i < grid.length; i++) {
      ans.add([]);
      for (var j = 0; j < grid[i].length; j++) {
        ans[i].add(column[i] + row[j]);
      }
    }
    return ans;
  }
}
