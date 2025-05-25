class Solution {
  List<List<int>> generate(int numRows) {
    List<List<int>> triangle = [];
    for (var i = 1; i <= numRows; i++) {
      triangle.add([]);
      for (var j = 1; j <= i; j++) {
        if (j == 1 || j == i) {
          triangle[i - 1].add(1);
        } else {
          triangle[i - 1].add(triangle[i - 2][j - 2] + triangle[i - 2][j - 1]);
        }
      }
    }
    return triangle;
  }
}
