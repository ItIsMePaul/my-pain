class Solution {
  bool checkStraightLine(List<List<int>> coordinates) {
    if (coordinates.length == 2) return true;
    List<int> x = [];
    List<int> y = [];
    for (var coordinate in coordinates) {
      x.add(coordinate[0]);
      y.add(coordinate[1]);
    }
    if (x.toSet().length == 1 || y.toSet().length == 1) return true;

    double controlAngle = (y[1] - y[0]) / (x[1] - x[0]);
    for (var i = 1; i < x.length - 1; i++) {
      double tempAngle = (y[i + 1] - y[i]) / (x[i + 1] - x[i]);
      if (tempAngle != controlAngle) {
        return false;
      }
    }
    return true;
  }
}
