class Solution {
  bool isValidSudoku(List<List<String>> board) {
    List<String> tempSquare = [];
    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board.length; j++) {
        int row = i ~/ 3;
        int column = i % 3;
        if (tempSquare.contains(board[j % 3 + 3 * row][j ~/ 3 + 3 * column])) {
          return false;
        } else {
          if (board[j % 3 + 3 * row][j ~/ 3 + 3 * column] != '.') {
            tempSquare.add(board[j % 3 + 3 * row][j ~/ 3 + 3 * column]);
          }
        }
      }
      tempSquare.clear();
    }
    List<String> tempRow = [];
    List<String> tempColumn = [];
    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board.length; j++) {
        if (tempRow.contains(board[i][j]) || tempColumn.contains(board[j][i])) {
          return false;
        } else {
          if (board[i][j] != '.') {
            tempRow.add(board[i][j]);
          }
          if (board[j][i] != '.') {
            tempColumn.add(board[j][i]);
          }
        }
      }
      tempRow.clear();
      tempColumn.clear();
    }

    return true;
  }
}
