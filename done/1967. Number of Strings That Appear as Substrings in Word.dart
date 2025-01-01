class Solution {
  int numOfStrings(List<String> patterns, String word) {
    int ans = 0;
    for (var s in patterns) {
      if (word.contains(s)) ans++;
    }
    return ans;
  }
}
