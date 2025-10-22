class Solution {
  bool checkDivisibility(int n) {
    int product = 1;
    int sum = 0;
    for (var digit in n.toString().split('')) {
      product *= int.parse(digit);
      sum += int.parse(digit);
    }
    return n % (sum + product) == 0;
  }
}
