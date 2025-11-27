class Solution {
  List<int> selfDividingNumbers(int left, int right) {
    List<int> result = [];
    for (var i = left; i <= right; i++) {
      int tr = i.toString().length;
      int j = 0;
      for (var e in i.toString().split('')) {
        if (e != '0') {
          if (i % int.parse(e) == 0) {
            j++;
          }
        }
      }
      if (tr == j) {
        result.add(i);
      }
    }
    return result;
  }
}
