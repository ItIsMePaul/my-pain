class Solution {
  bool squareIsWhite(String c) {
    return (c[0].codeUnits[0] + int.parse(c[1])) % 2 == 0;
  }
}
