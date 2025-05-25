class Solution {
  double maxAverageRatio(List<List<int>> classes, int extraStudents) {
    List<double> passRatios = [];
    for (var i = 0; i < classes.length; i++) {
      double passRatio = classes[i][0] / classes[i][1];
      passRatios.add(passRatio);
    }
    double sum = passRatios.fold(0.0, (pv, e) => pv + e);
    double ans = sum / passRatios.length;
    for (var i = 0; i < classes.length; i++) {
      double temp = sum - classes[i][0] / classes[i][1];
      double currentRatio =
          (classes[i][1] + extraStudents) / (classes[i][1] + extraStudents);
      double newPassRatios = (temp + currentRatio) / classes.length;
      if (newPassRatios > ans) {
        ans = newPassRatios;
      }
    }
    return ans;
  }
}
