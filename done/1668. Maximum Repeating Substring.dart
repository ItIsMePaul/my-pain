class Solution {
  int maxRepeating(String sequence, String word) {
    if (sequence == word) {
      return 1;
    }
    Set<int> anss = {};
    int ans = 0;
    for (var i = sequence.length; i >= 0; i--) {
      if (i - word.length < 0) {
        anss.add(ans);
        break;
      }
      String temp = sequence.substring(i - word.length, i);
      if (word == temp) {
        i -= word.length - 1;
        ans++;
      } else {
        anss.add(ans);
        ans = 0;
      }
    }
    anss.add(ans);
    ans = 0;
    for (var i = 0; i <= sequence.length - word.length; i++) {
      String temp = sequence.substring(i, i + word.length);
      if (word == temp) {
        i += word.length - 1;
        ans++;
      } else {
        anss.add(ans);
        ans = 0;
      }
    }
    for (var e in anss) {
      if (e > ans) {
        ans = e;
      }
    }
    return ans;
  }
}
