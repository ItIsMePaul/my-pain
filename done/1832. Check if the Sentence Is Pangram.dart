class Solution {
  bool checkIfPangram(String sentence) {
    if (sentence.split('').toSet().length >= 26) {
      return true;
    } else {
      return false;
    }
  }
}
