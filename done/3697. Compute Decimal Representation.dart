class Solution {
  List<int> decimalRepresentation(int n) {
    List<int> res = [];
    int divisor = 10;
    while (n > 0) {
      int temp = n % divisor;
      divisor *= 10;
      n -= temp;
      if (temp > 0) res.insert(0, temp);
    }
    return res;
  }
}
