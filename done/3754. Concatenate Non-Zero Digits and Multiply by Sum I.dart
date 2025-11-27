class Solution {
  int sumAndMultiply(int n) {
    if (n == 0) return 0;
    int sum = 0;
    StringBuffer number = StringBuffer();
    for (var num in n.toString().split('')) {
      if (num != '0') {
        sum += int.parse(num);
        number.write(num);
      }
    }
    return int.parse(number.toString()) * sum;
  }
}
