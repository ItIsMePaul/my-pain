class Solution {
  bool isToeplitzMatrix(List<List<int>> matrix) {
    int rows = matrix.length;
    for (int i = 0; i < rows - 1; i++) {
      for (int j = 0; j < rows - i - 1; j++) {
        matrix[i].insert(0, -1);
        matrix[rows - 1 - i].add(-1);
      }
    }
    int cols = matrix[0].length;
    for (var i = 0; i < cols; i++) {
      Set<int> diagonal = {};
      for (var j = 0; j < rows; j++) {
        if (matrix[j][i] != -1) diagonal.add(matrix[j][i]);
        if (diagonal.length > 1) return false;
      }
    }
    return true;
  }
}