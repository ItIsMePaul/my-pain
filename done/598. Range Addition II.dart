class Solution {
  int maxCount(int m, int n, List<List<int>> ops) {
    int minN = m;
    int minM = n;

    for (var op in ops) {
      minN = op[0] > minN ? minN : op[0];
      minM = op[1] > minM ? minM : op[1];
    }

    return minN * minM;
  }
}
