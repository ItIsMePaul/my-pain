class Solution {
  List<List<int>> largestLocal(List<List<int>> grid) {
    List<List<int>> ans = [];
    for (var i = 1; i < grid.length - 1; i++) {
      List<int> temp = [];
      for (var j = 1; j < grid.length - 1; j++) {
        int maxNum = grid[i][j];
        for (var n = i - 1; n <= i + 1; n++) {
          for (var m = j - 1; m <= j + 1; m++) {
            maxNum = grid[n][m] > maxNum ? grid[n][m] : maxNum;
          }
        }
        temp.add(maxNum);
      }
      ans.add(temp);
    }
    return ans;
  }
}
