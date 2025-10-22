class Solution {
  List<int> getRow(int rowIndex) {
    if (rowIndex == 0) return [1];
    if (rowIndex == 1) return [1, 1];
    List<int> previousRow = [1, 1];
    List<int> currentRow = [];
    for (var i = 2; i <= rowIndex; i++) {
      for (var j = 1; j <= i + 1; j++) {
        if (j == 1 || j == i + 1) {
          currentRow.add(1);
        } else {
          currentRow.add(previousRow[j - 2] + previousRow[j - 1]);
        }
      }
      previousRow = List.of(currentRow);
      currentRow.clear();
    }
    return previousRow;
  }
}