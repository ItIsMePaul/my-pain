class Solution {
  int smallestNumber(int n, int t) {
    int prd(String num) {
      int product = 1;
      for (var i = 0; i < num.length; i++) {
        product *= int.parse(num[i]);
      }
      return product;
    }

    String num = n.toString();
    if (num.contains('0')) {
      return n;
    }
    int product = prd(num);
    while (product % t != 0) {
      n++;
      product = prd(n.toString());
    }
    return n;
  }
}
