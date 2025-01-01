class Solution {
  bool checkZeroOnes(String s) {
    int longestZeros = 0;
    int longestOnes = 0;
    int startPos = 0;
    int currentPos = 0;
    String current = s[0];
    for (var i = 0; i < s.length; i++) {
      if (current == s[i]) {
        currentPos++;
      } else {
        if (current == '1' && currentPos - startPos > longestOnes)
          longestOnes = currentPos - startPos;
        if (current == '0' && currentPos - startPos > longestZeros)
          longestZeros = currentPos - startPos;
        startPos = i;
        currentPos = i + 1;
        current = s[i];
      }
    }
    if (current == '1' && currentPos - startPos > longestOnes)
      longestOnes = currentPos - startPos + 1;
    if (current == '0' && currentPos - startPos > longestZeros)
      longestZeros = currentPos - startPos + 1;
    print(longestOnes);
    print(longestZeros);
    return longestOnes > longestZeros;
  }
}
