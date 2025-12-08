class Solution {
  int numSpecial(List<List<int>> mat) {
    List<List<int>> mapHorizontally = [];
    List<List<int>> mapVertically = [];
    for (var i = 0; i < mat.length; i++) {
      mapHorizontally.add([]);
      for (var j = 0; j < mat[i].length; j++) {
        if (mat[i][j] == 1) {
          mapHorizontally[i].add(j);
        }
      }
    }
    for (var i = 0; i < mat[0].length; i++) {
      mapVertically.add([]);
      for (var j = 0; j < mat.length; j++) {
        if (mat[j][i] == 1) {
          mapVertically[i].add(j);
        }
      }
    }
    int result = 0;
    for (var row in mapHorizontally) {
      if (row.length == 1 && mapVertically[row.first].length == 1) {
        result++;
      }
    }
    return result;
  }
}
