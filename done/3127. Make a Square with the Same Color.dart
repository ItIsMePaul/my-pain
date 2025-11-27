class Solution {
  bool canMakeSquare(List<List<String>> grid) {
    for (var i = 0; i < grid.length - 1; i++) {
      for (var j = 0; j < grid[i].length - 1; j++) {
        Map<String, int> map = {};
        map[grid[i][j]] = (map[grid[i][j]] ?? 0) + 1;
        map[grid[i + 1][j]] = (map[grid[i + 1][j]] ?? 0) + 1;
        map[grid[i][j + 1]] = (map[grid[i][j + 1]] ?? 0) + 1;
        map[grid[i + 1][j + 1]] = (map[grid[i + 1][j + 1]] ?? 0) + 1;
        if (map.containsValue(4) || map.containsValue(1)) {
          return true;
        }
      }
    }
    return false;
  }
}
