class Solution {
  int possibleStringCount(String word) {
    int result = 0;
    int temp = 0;
    String previousChar = word[0];
    for (var i = 1; i < word.length; i++) {
      if (word[i] == previousChar) {
        temp++;
      } else {
        result += temp;
        temp = 0;
        previousChar = word[i];
      }
    }
    return result + temp;
  }
}
