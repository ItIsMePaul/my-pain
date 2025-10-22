class Solution {
  int numTeams(List<int> r) {
    int count = 0;
    for (var i = 0; i < r.length; i++) {
      for (var j = i + 1; j < r.length; j++) {
        for (var k = j + 1; k < r.length; k++) {
          if ((r[i] > r[j] && r[j] > r[k]) || (r[i] < r[j] && r[j] < r[k])) {
            count++;
          }
        }
      }
    }
    return count;
  }
}
