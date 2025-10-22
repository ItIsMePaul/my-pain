import 'dart:math';

class Solution {
  int countSquares(List<List<int>> matrix) {
    int maxSize = max(matrix.length, matrix[0].length);
    int count = 0;
    for (int size = 1; size <= maxSize; size++) {
      for (var row = 0; row <= matrix.length - size; row++) {
        for (var col = 0; col <= matrix[0].length - size; col++) {
          bool allOnes = true;
          for (var i = row; i < row + size; i++) {
            for (var j = col; j < col + size; j++) {
              if (matrix[i][j] == 0) {
                allOnes = false;
                break;
              }
            }
            if (!allOnes) break;
          }
          if (allOnes) count++;
        }
      }
    }
    return count;
  }
}
