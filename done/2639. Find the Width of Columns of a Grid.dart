class Solution {
  List<int> findColumnWidth(List<List<int>> grid) {
    List<int> result = List.filled(grid[0].length, -1);
    for (var i = 0; i < grid[0].length; i++) {
      int maxLength = 0;
      for (var j = 0; j < grid.length; j++) {
        int length = grid[j][i].toString().length;
        if (maxLength < length) maxLength = length;
      }
      result[i] = maxLength;
    }
    return result;
  }
}
