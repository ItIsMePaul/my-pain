class Solution {
  int countNegatives(List<List<int>> grid) {
    int ans = 0;
    for (var row in grid) {
      for (var e in row) {
        if (e < 0) {
          ans++;
        }
      }
    }
    return ans;
  }
}
