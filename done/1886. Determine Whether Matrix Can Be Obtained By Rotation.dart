class Solution {
  bool findRotation(List<List<int>> mat, List<List<int>> target) {
    bool _sameMatrix(List<List<int>> matrix, List<List<int>> target) {
      for (var i = 0; i < matrix.length; i++) {
        String rowMat = matrix[i].join();
        String rowTarget = target[i].join();
        if (rowMat != rowTarget) {
          return false;
        }
      }
      return true;
    }

    int n = mat.length;
    for (var m = 0; m < 4; m++) {
      for (var i = 0; i < n ~/ 2; i++) {
        for (var j = i; j < n - i - 1; j++) {
          int temp = mat[i][j];
          mat[i][j] = mat[n - j - 1][i];
          mat[n - j - 1][i] = mat[n - i - 1][n - j - 1];
          mat[n - i - 1][n - j - 1] = mat[j][n - i - 1];
          mat[j][n - i - 1] = temp;
        }
      }
      if (_sameMatrix(mat, target)) {
        return true;
      }
    }
    return false;
  }
}
