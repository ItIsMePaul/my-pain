class Solution {
  List<List<int>> matrixReshape(List<List<int>> mat, int r, int c) {
    if (mat.length * mat[0].length != r * c) {
      return mat;
    }
    List<int> vec = [];
    for (var i = 0; i < mat.length; i++) {
      for (var j = 0; j < mat[0].length; j++) {
        vec.add(mat[i][j]);
      }
    }
    int m = 0;
    List<List<int>> res = [];
    for (var i = 0; i < r; i++) {
      List<int> tvec = [];
      for (var i = 0; i < c; i++) {
        tvec.add(vec[m++]);
      }
      res.add(tvec);
    }
    return res;
  }
}
