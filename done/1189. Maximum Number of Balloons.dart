class Solution {
  int maxNumberOfBalloons(String text) {
    Map<String, int> balloon = {
      'b': 1,
      'a': 1,
      'l': 2,
      'o': 1,
      'n': 1,
    };
    Map<String, int> countLetter = {};
    for (var i = 0; i < text.length; i++) {
      countLetter[text[i]] = (countLetter[text[i]] ?? 0) + 1;
    }
    int ans = 10000;
    for (var key in balloon.keys) {
      if (countLetter.containsKey(key)) {
        int temp = countLetter[key]! ~/ balloon[key]!;
        ans = ans > temp ? temp : ans;
      } else {
        return 0;
      }
    }
    return ans;
  }
}
