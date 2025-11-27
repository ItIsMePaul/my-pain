class Solution {
  int maximumNumberOfStringPairs(List<String> words) {
    int ans = 0;
    String swap(String s) {
      return s[1] + s[0];
    }

    for (var i = 0; i < words.length; i++) {
      for (var j = i + 1; j < words.length; j++) {
        if (swap(words[i]) == words[j]) {
          ans++;
          words.removeAt(j);
          words.removeAt(i);
          i = -1;
          break;
        }
      }
    }
    return ans;
  }
}
