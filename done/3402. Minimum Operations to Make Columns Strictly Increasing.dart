class Solution {
  int minimumOperations(List<List<int>> grid) {
    int ans = 0;
    for (var c = 0; c < grid[0].length; c++) {
      for (var r = 0; r < grid.length - 1; r++) {
        if (grid[r][c] >= grid[r + 1][c]) {
          ans += grid[r][c] - grid[r + 1][c] + 1;
          grid[r + 1][c] = grid[r][c] + 1;
        }
      }
    }
    return ans;
  }
}
