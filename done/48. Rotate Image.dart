class Solution {
  void rotate(List<List<int>> matrix) {
    List<List<int>> temp = matrix.map((list) => List.of(list)).toList();
    for (var i = 0; i < matrix.length; i++) {
      for (var j = 0; j < matrix[0].length; j++) {
        matrix[j][matrix.length - 1 - i] = temp[i][j];
      }
    }
    temp.clear();
  }
}
