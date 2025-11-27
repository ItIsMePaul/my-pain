class Solution {
  int finalPositionOfSnake(int n, List<String> commands) {
    List<List<int>> gameField = [];
    int m = 0;
    for (var i = 0; i < n; i++) {
      List<int> row = [];
      for (var j = 0; j < n; j++) {
        row.add(m++);
      }
      gameField.add(row);
    }

    List<int> position = [0, 0];
    for (var e in commands) {
      switch (e) {
        case 'UP':
          position[0]--;
          break;
        case 'DOWN':
          position[0]++;
          break;
        case 'RIGHT':
          position[1]++;
          break;
        case 'LEFT':
          position[1]--;
          break;
      }
      if (position[0] < 0) position[0] = n - 1;
      if (position[0] >= n) position[0] = 0;
      if (position[1] < 0) position[1] = n - 1;
      if (position[1] >= n) position[1] = 0;
    }

    return gameField[position[0]][position[1]];
  }
}
