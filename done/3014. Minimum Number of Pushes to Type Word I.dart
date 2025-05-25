class Solution {
  int minimumPushes(String word) {
    List<int> letters = List.filled(26, 0, growable: true);
    for (var code in word.codeUnits) {
      letters[code - 97]++;
    }
    letters.removeWhere((item) => item == 0);
    letters.sort();
    int ans = 0;
    for (var i = 0; i < letters.length; i++) {
      ans += (i ~/ 8 + 1) * letters[i];
    }
    return ans;
  }
}
