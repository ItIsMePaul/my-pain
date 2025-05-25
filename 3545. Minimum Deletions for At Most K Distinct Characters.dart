class Solution {
  int minDeletion(String s, int k) {
    Map<String, int> map = {};
    for (var i = 0; i < s.length; i++) map[s[i]] = (map[s[i]] ?? 0) + 1;
    int ans = 0;
    int count = 0;
    List<int> values = map.values.toList()..sort((a, b) => b.compareTo(a));
    for (var value in values) {
      count++;
      if (count > k) {
        ans += value;
      }
    }
    return ans;
  }
}
