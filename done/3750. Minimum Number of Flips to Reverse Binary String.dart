class Solution {
  int minimumFlips(int n) {
    String binary = n.toRadixString(2);
    int result = 0;
    for (var i = 0; i < binary.length; i++) {
      if (binary[i] != binary[binary.length - 1 - i]) result++;
    }
    return result;
  }
}
