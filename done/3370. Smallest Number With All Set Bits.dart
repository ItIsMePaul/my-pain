class Solution {
  int smallestNumber(int n) {
    String binary = n.toRadixString(2).replaceAll('0', '1');
    return int.parse(binary, radix: 2);
  }
}
