class Solution {
  List<List<int>> matrixBlockSum(List<List<int>> mat, int k) {
    int m = mat.length;
    int n = mat[0].length;
    List<List<int>> ans = List.generate(m, (_) => List.filled(n, 0));
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int sum = 0;
        for (int r = i - k; r <= i + k; r++) {
          for (int c = j - k; c <= j + k; c++) {
            if (r >= 0 && r < m && c >= 0 && c < n) {
              sum += mat[r][c];
            }
          }
        }
        ans[i][j] = sum;
      }
    }
    return ans;
  }
}
