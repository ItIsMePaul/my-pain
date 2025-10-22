class Solution {
  int islandPerimeter(List<List<int>> grid) {
    int perimeter = 0;
    int rows = grid.length;
    int cols = grid[0].length;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 1) {
          if (r == 0 || grid[r - 1][c] == 0) perimeter++;
          if (r == rows - 1 || grid[r + 1][c] == 0) perimeter++;
          if (c == 0 || grid[r][c - 1] == 0) perimeter++;
          if (c == cols - 1 || grid[r][c + 1] == 0) perimeter++;
        }
      }
    }
    return perimeter;
  }
}
