class Solution {
  List<int> zigzagTraversal(List<List<int>> grid) {
    bool skip = false;
    List<int> ans = [];
    for (var i = 0; i < grid.length; i++) {
      for (var j = 0; j < grid[i].length; j++) {
        if (skip) {
          skip = !skip;
          continue;
        }
        if (i % 2 == 0) {
          ans.add(grid[i][j]);
        } else {
          ans.add(grid[i][grid[i].length - 1 - j]);
        }
        skip = !skip;
      }
    }
    return ans;
  }
}
