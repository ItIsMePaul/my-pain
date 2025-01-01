class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    for (var e in matrix) {
      if (e.last <= target && e.first > target) {
        continue;
      } else {
        int low = 0;
        int high = e.length - 1;
        while (low <= high) {
          int mid = low + (high - low) ~/ 2;
          if (e[mid] == target) return true;
          if (e[mid] < target)
            low = mid + 1;
          else
            high = mid - 1;
        }
      }
    }
    return false;
  }
}
