import 'dart:math';

class Solution {
  List<List<int>> diagonalSort(List<List<int>> mat) {
    int m = mat.length;
    int n = mat[0].length;
    for (var k = 0; k < m + n - 1; k++) {
      List<int> diagonal = [];
      for (var i = max(0, k - n + 1); i < min(k + 1, m); i++) {
        int j = i - k - 1 + n;
        diagonal.add(mat[i][j]);
      }
      diagonal.sort();
      int l = 0;
      for (var i = max(0, k - n + 1); i < min(k + 1, m); i++) {
        int j = i - k - 1 + n;
        mat[i][j] = diagonal[l++];
      }
    }
    return mat;
  }
}
