class Solution {
  List<List<int>> transpose(List<List<int>> matrix) {
    List<List<int>> fMatrix = List.generate(
      matrix[0].length,
      (i) => List.generate(matrix.length, (j) => 0),
    );
    print(fMatrix);
    for (var i = 0; i < matrix.length; i++) {
      for (var j = 0; j < matrix[i].length; j++) {
        fMatrix[j][i] = matrix[i][j];
      }
    }
    return fMatrix;
  }
}
