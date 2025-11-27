class Solution {
  int countIslands(List<List<int>> grid, int k) {
    Set<String> visited = {};
    int result = 0;
    for (var i = 0; i < grid.length; i++) {
      for (var j = 0; j < grid[i].length; j++) {
        if (grid[i][j] != 0 && !visited.contains('$i|$j')) {
          int sum = grid[i][j];
          Set<List<int>> points = {
            [i, j],
          };
          while (points.isNotEmpty) {
            print(points);
            List<int> p = points.elementAt(0);
            points.remove(p);

            if (p[0] - 1 >= 0 &&
                grid[p[0] - 1][p[1]] != 0 &&
                !visited.contains('${p[0] - 1}|${p[1]}')) {
              sum += grid[p[0] - 1][p[1]];
              points.add([p[0] - 1, p[1]]);
            }
            if (p[0] + 1 < grid.length &&
                grid[p[0] + 1][p[1]] != 0 &&
                !visited.contains('${p[0] + 1}|${p[1]}')) {
              sum += grid[p[0] + 1][p[1]];
              points.add([p[0] + 1, p[1]]);
            }
            if (p[1] - 1 >= 0 &&
                grid[p[0]][p[1] - 1] != 0 &&
                !visited.contains('${p[0]}|${p[1] - 1}')) {
              sum += grid[p[0]][p[1] - 1];
              points.add([p[0], p[1] - 1]);
            }
            if (p[1] + 1 < grid[i].length &&
                grid[p[0]][p[1] + 1] != 0 &&
                !visited.contains('${p[0]}|${p[1] + 1}')) {
              sum += grid[p[0]][p[1] + 1];
              points.add([p[0], p[1] + 1]);
            }
            visited.add('${p[0]}|${p[1]}');
          }
          print(sum);
          if (sum % k == 0) result++;
        } else {
          visited.add('$i|$j');
        }
      }
    }
    return result;
  }
}

void main() {
  List<List<int>> grid = [
    [3, 0, 0, 0, 0, 19],
    [5, 13, 3, 0, 0, 0],
    [2, 6, 0, 0, 0, 0],
  ];
  int k = 16;
  print(Solution().countIslands(grid, k));
}
