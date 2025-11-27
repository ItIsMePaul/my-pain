class Solution {
  int countWords(List<String> words1, List<String> words2) {
    int ans = 0;
    for (var e in words1) {
      if (words2.contains(e)) {
        int temp1 = 0;
        for (var w in words1) {
          if (e == w) {
            temp1++;
          }
        }
        int temp2 = 0;
        for (var w in words2) {
          if (e == w) {
            temp2++;
          }
        }
        if (temp1 == 1 && temp2 == 1) {
          ans++;
        }
      }
    }
    return ans;
  }
}
