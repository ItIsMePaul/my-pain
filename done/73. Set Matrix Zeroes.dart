class Solution {
  void setZeroes(List<List<int>> matrix) {
    List<List<int>> coordinates = [];
    for (var i = 0; i < matrix.length; i++) {
      for (var j = 0; j < matrix[i].length; j++) {
        if (matrix[i][j] == 0) {
          coordinates.add([i, j]);
        }
      }
    }
    for (var coordinate in coordinates) {
      for (var i = 0; i < matrix[coordinate[0]].length; i++) {
        matrix[coordinate[0]][i] = 0;
      }
      for (var i = 0; i < matrix.length; i++) {
        matrix[i][coordinate[1]] = 0;
      }
    }
  }
}
