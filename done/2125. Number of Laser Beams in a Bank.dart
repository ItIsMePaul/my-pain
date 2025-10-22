class Solution {
  int numberOfBeams(List<String> bank) {
    List<int> beams = [];

    for (var row in bank) {
      int count = 0;
      for (var i = 0; i < row.length; i++) if (row[i] == '1') count++;
      if (count == 0) continue;
      beams.add(count);
    }
    int ans = 0;
    for (var i = 1; i < beams.length; i++) {
      ans += beams[i - 1] * beams[i];
    }
    return ans;
  }
}
