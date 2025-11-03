class Solution {
  int countUnguarded(
    int m,
    int n,
    List<List<int>> guards,
    List<List<int>> walls,
  ) {
    Set<String> seen = {};
    List<List<String>> field = List.generate(
      m,
      (int index) => List.filled(n, '.'),
    );
    for (var wall in walls) field[wall[0]][wall[1]] = 'W';
    for (var guard in guards) field[guard[0]][guard[1]] = 'G';
    for (var guard in guards) {
      int step = 1;
      bool north = true;
      bool south = true;
      bool west = true;
      bool east = true;
      while (north || south || west || east) {
        if (north &&
            guard[0] - step >= 0 &&
            field[guard[0] - step][guard[1]] == '.') {
          seen.add('${guard[0] - step},${guard[1]}');
        } else {
          north = false;
        }
        if (south &&
            guard[0] + step < m &&
            field[guard[0] + step][guard[1]] == '.') {
          seen.add('${guard[0] + step},${guard[1]}');
        } else {
          south = false;
        }
        if (west &&
            guard[1] - step >= 0 &&
            field[guard[0]][guard[1] - step] == '.') {
          seen.add('${guard[0]},${guard[1] - step}');
        } else {
          west = false;
        }
        if (east &&
            guard[1] + step < n &&
            field[guard[0]][guard[1] + step] == '.') {
          seen.add('${guard[0]},${guard[1] + step}');
        } else {
          east = false;
        }
        step++;
      }
    }
    return m * n - seen.length - walls.length - guards.length;
  }
}
