class Solution {
  int maxWidthOfVerticalArea(List<List<int>> points) {
    List<int> temp = points.map((p) => p[0]).toSet().toList()..sort();

    int ans = 0;
    for (var i = 0; i < temp.length - 1; i++) {
      if (ans < temp[i + 1] - temp[i]) ans = temp[i + 1] - temp[i];
    }

    return ans;
  }
}
