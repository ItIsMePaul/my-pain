class NeighborSum {
  final List<List<int>> grid;
  final Map<int, List<int>> map = {};
  NeighborSum(this.grid) {
    for (var i = 0; i < grid.length; i++) {
      for (var j = 0; j < grid[i].length; j++) {
        map[grid[i][j]] = [i, j];
      }
    }
  }

  int adjacentSum(int value) {
    int? top = getValue(grid, map[value]![0] - 1, map[value]![1]);
    int? down = getValue(grid, map[value]![0] + 1, map[value]![1]);
    int? left = getValue(grid, map[value]![0], map[value]![1] - 1);
    int? right = getValue(grid, map[value]![0], map[value]![1] + 1);
    return (top ?? 0) + (down ?? 0) + (left ?? 0) + (right ?? 0);
  }

  int diagonalSum(int value) {
    int? topLeft = getValue(grid, map[value]![0] - 1, map[value]![1] - 1);
    int? topRight = getValue(grid, map[value]![0] - 1, map[value]![1] + 1);
    int? downLeft = getValue(grid, map[value]![0] + 1, map[value]![1] - 1);
    int? downRight = getValue(grid, map[value]![0] + 1, map[value]![1] + 1);

    return (topLeft ?? 0) +
        (topRight ?? 0) +
        (downLeft ?? 0) +
        (downRight ?? 0);
  }

  int? getValue(List<List<int>> grid, int row, int column) {
    try {
      return grid[row][column];
    } catch (e) {
      return null;
    }
  }
}

/**
 * Your NeighborSum object will be instantiated and called as such:
 * NeighborSum obj = NeighborSum(grid);
 * int param1 = obj.adjacentSum(value);
 * int param2 = obj.diagonalSum(value);
 */