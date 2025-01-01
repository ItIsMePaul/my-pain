class Solution {
  bool checkValid(List<List<int>> matrix) {
    for (var i = 0; i < matrix.length; i++) {
      Set<int> temp = {};
      for (var j = 0; j < matrix.length; j++) {
        temp.add(matrix[j][i]);
      }
      if (temp.length != matrix[i].length) {
        return false;
      }
    }
    for (var i = 0; i < matrix.length; i++) {
      if (matrix[i].length != matrix[i].toSet().length) {
        return false;
      }
    }

    return true;
  }
}
