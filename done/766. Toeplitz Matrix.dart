class Solution {
  bool isToeplitzMatrix(List<List<int>> matrix) {
    for (int i = 0; i < matrix.length; i++) {
      List<int> temp = [];
      for (int j = 0; j < matrix[i].length; j++) {
        temp.add(matrix[i][j]);
        if (temp.isNotEmpty && temp.first != temp.last) {
          return false;
        }
      }
    }
    return true;
  }
}
