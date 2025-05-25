class Solution {
  int partitionString(String s) {
    Map<String, int> map = {};
    int ans = 0;
    for (int i = 0; i < s.length; i++) {
      map[s[i]] = (map[s[i]] ?? 0) + 1;
      if (map[s[i]] == 2) {
        ans++;
        map.clear();
        map[s[i]] = (map[s[i]] ?? 0) + 1;
      }
    }
    if (map.isNotEmpty) {
      ans++;
    }
    return ans;
  }
}

void main() {
  print(Solution().partitionString("ssssss")); // 6
  print(Solution().partitionString("abacaba")); // 4
  print(Solution().partitionString("cuieokbs")); // 1
}
