class Solution {
  int nearestValidPoint(int x, int y, List<List<int>> p) {
    int abs(int n) {
      if (n < 0) {
        return -1 * n;
      } else {
        return n;
      }
    }

    bool ft = true;
    int res = -1;
    for (var i = 0; i < p.length; i++) {
      if (p[i][0] == x || p[i][1] == y) {
        int temp = abs(x - p[i][0]) + abs(y - p[i][1]);
        if (res > temp || ft) {
          res = i;
          ft = false;
        }
      }
    }
    return res;
  }
}
