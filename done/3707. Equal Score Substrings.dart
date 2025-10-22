class Solution {
  bool scoreBalance(String s) {
    int leftSum = 0;
    int rightSum = 0;
    List<int> scores = [];
    for (var char in s.split('')) {
      scores.add(char.codeUnitAt(0) - 'a'.codeUnitAt(0) + 1);
    }
    rightSum = scores.reduce((a, b) => a + b);
    for (int i = 0; i < scores.length - 1; i++) {
      leftSum += scores[i];
      rightSum -= scores[i];
      if (leftSum == rightSum) {
        return true;
      }
    }
    return false;
  }
}
