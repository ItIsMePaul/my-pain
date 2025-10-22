class Solution {
  String getSmallestString(int n, int k) {
    List<int> codes = List.filled(n, 97);
    k -= n;
    n--;
    while (k > 0) {
      if (k >= 25) {
        codes[n] += 25;
        k -= 25;
        n--;
      } else {
        codes[n] += k;
        k = 0;
      }
    }
    return String.fromCharCodes(codes);
  }
}
