class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    List<int> spiral = [];
    while (matrix.isNotEmpty) {
      spiral.addAll(matrix.first);
      matrix.removeAt(0);
      if (matrix.isEmpty) break;
      for (var i = 0; i < matrix.length; i++) {
        spiral.add(matrix[i].removeLast());
        if (matrix[i].isEmpty) {
          matrix.removeAt(i);
          i--;
        }
      }
      if (matrix.isEmpty) break;
      spiral.addAll(matrix.last.reversed);
      matrix.removeLast();
      if (matrix.isEmpty) break;
      for (var i = matrix.length - 1; i >= 0; i--) {
        spiral.add(matrix[i].removeAt(0));
        if (matrix[i].isEmpty) {
          matrix.removeAt(i);
        }
      }
    }
    return spiral;
  }
}

void main() {
  print(
    Solution().spiralOrder([
      [1, 11],
      [2, 12],
      [3, 13],
      [4, 14],
      [5, 15],
      [6, 16],
      [7, 17],
      [8, 18],
      [9, 19],
      [10, 20],
    ]),
  );
}
