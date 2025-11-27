class Solution {
  double largestTriangleArea(List<List<int>> points) {
    double result = 0.0;
    for (var i = 0; i < points.length; i++) {
      int ax1 = points[i][0];
      int ay1 = points[i][1];
      for (var j = i + 1; j < points.length; j++) {
        int bx2 = points[j][0];
        int by2 = points[j][1];
        for (var k = j + 1; k < points.length; k++) {
          int cx3 = points[k][0];
          int cy3 = points[k][1];
          double temp =
              (ax1 * (by2 - cy3) + bx2 * (cy3 - ay1) + cx3 * (ay1 - by2))
                  .abs() /
              2;
          if (temp > result) {
            result = temp;
          }
        }
      }
    }
    return result;
  }
}
