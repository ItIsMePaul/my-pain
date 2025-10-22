class Solution {
  List<int> getNoZeroIntegers(int n) {
    for (var i = 1; i < n; i++) {
      int fn = i, sn = n - i;
      if (!fn.toString().contains('0') && !sn.toString().contains('0')) {
        return [fn, sn];
      }
    }
    return [1, 1];
  }
}
