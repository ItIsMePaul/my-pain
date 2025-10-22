class Solution {
  String concatHex36(int n) =>
      ((n * n).toRadixString(16) + (n * n * n).toRadixString(36)).toUpperCase();
}
