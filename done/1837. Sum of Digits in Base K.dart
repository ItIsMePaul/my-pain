class Solution {
  int sumBase(int n, int k) {
    int num;
    String str = '';
    while (n > 0) {
      num = n % k;
      n = n ~/ k;
      str += num.toString();
    }
    int fr = 0;
    for (var e in str.split('')) {
      fr += int.parse(e);
    }
    return fr;
  }
}
