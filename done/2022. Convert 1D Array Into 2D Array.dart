class Solution {
  List<List<int>> construct2DArray(List<int> original, int m, int n) {
    int l = original.length;
    if (m * n != l) {
      return [];
    }
    int c = 0;
    List<List<int>> result = [];
    for (var i = 0; i < m; i++) {
      result.add([]);
      for (var j = 0; j < n; j++) {
        result[i].add(original[c]);
        c++;
      }
    }
    return result;
  }
}
