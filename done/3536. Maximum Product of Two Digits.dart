class Solution {
  int maxProduct(int n) {
    int max = 0;
    List<int> digits = n.toString().split('').map(int.parse).toList();
    for (int i = 0; i < digits.length; i++) {
      for (int j = i + 1; j < digits.length; j++) {
        int product = digits[i] * digits[j];
        if (product > max) {
          max = product;
        }
      }
    }
    return max;
  }
}
