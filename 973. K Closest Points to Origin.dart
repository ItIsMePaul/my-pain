class Solution {
  List<List<int>> kClosest(List<List<int>> points, int k) {
    points.sort((a, b) => (a[0] * a[0] + a[1] * a[1]).compareTo((b[0] * b[0] + b[1] * b[1])));
    return points.sublist(0, k);
  }
}
