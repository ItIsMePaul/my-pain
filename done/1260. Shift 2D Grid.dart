class Solution {
  List<List<int>> shiftGrid(List<List<int>> grid, int k) {
    List<int> tarr = [];
    List<List<int>> rgrid = [];
    for (var i = 0; i < grid.length; i++) {
      for (var j = 0; j < grid[i].length; j++) {
        tarr.add(grid[i][j]);
      }
    }
    print(tarr);
    for (var i = 0; i < k; i++) {
      tarr.insert(0, tarr.last);
      tarr.removeAt(tarr.length - 1);
    }
    print(tarr);
    int m = 0;
    for (var i = 0; i < grid.length; i++) {
      rgrid.add([]);
      for (var j = 0; j < grid[i].length; j++) {
        rgrid[i].add(tarr[m]);
        m++;
      }
    }
    return grid;
  }
}
