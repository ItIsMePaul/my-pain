class Solution {
  List<List<int>> reconstructMatrix(int upper, int lower, List<int> colsum) {
    List<int> firstRow = List.filled(colsum.length, -1);
    List<int> secondRow = List.filled(colsum.length, -1);
    for (var i = 0; i < colsum.length; i++) {
      if (colsum[i] == 2 && upper > 0 && lower > 0) {
        firstRow[i] = 1;
        secondRow[i] = 1;
        upper--;
        lower--;
      } else if (colsum[i] == 0) {
        firstRow[i] = 0;
        secondRow[i] = 0;
      } else if (colsum[i] == 2) {
        return [];
      }
    }
    for (var i = 0; i < colsum.length; i++) {
      if (colsum[i] == 1 && upper > 0) {
        firstRow[i] = 1;
        secondRow[i] = 0;
        upper--;
      } else if (colsum[i] == 1 && lower > 0) {
        firstRow[i] = 0;
        secondRow[i] = 1;
        lower--;
      } else if (colsum[i] == 1) {
        return [];
      }
    }
    return [firstRow, secondRow];
  }
}

void main() {
  print(Solution().reconstructMatrix(4, 2, [1, 2, 1, 2, 0]));
}
