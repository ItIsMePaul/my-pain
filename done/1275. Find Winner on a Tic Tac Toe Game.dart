class Solution {
  String tictactoe(List<List<int>> moves) {
    List<List<String>> field = [
      ['.', '.', '.'],
      ['.', '.', '.'],
      ['.', '.', '.'],
    ];
    for (var i = 0; i < moves.length; i++) {
      field[moves[i][0]][moves[i][1]] = i % 2 == 0 ? 'A' : 'B';
    }
    bool winA = (field[0][0] == field[1][1] &&
            field[1][1] == field[2][2] &&
            field[0][0] == 'A') ||
        (field[0][2] == field[1][1] &&
            field[1][1] == field[2][0] &&
            field[0][2] == 'A');
    bool winB = (field[0][0] == field[1][1] &&
            field[1][1] == field[2][2] &&
            field[0][0] == 'B') ||
        (field[0][2] == field[1][1] &&
            field[1][1] == field[2][0] &&
            field[0][2] == 'B');
    for (var i = 0; i < 3; i++) {
      winA = (field[i][0] == field[i][1] &&
              field[i][1] == field[i][2] &&
              field[i][0] == 'A') ||
          (field[0][i] == field[1][i] &&
              field[1][i] == field[2][i] &&
              field[0][i] == 'A') ||
          winA;
      if (winA) return 'A';
      winB = (field[i][0] == field[i][1] &&
              field[i][1] == field[i][2] &&
              field[i][0] == 'B') ||
          (field[0][i] == field[1][i] &&
              field[1][i] == field[2][i] &&
              field[0][i] == 'B') ||
          winB;
      if (winB) return 'B';
    }
    if (moves.length >= 9) {
      return 'Draw';
    } else {
      return 'Pending';
    }
  }
}
