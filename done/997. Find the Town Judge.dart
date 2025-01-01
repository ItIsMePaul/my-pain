class Solution {
  int findJudge(int n, List<List<int>> trust) {
    if (n == 1) {
      return 1;
    }
    if (trust.isEmpty) {
      return -1;
    }
    Map<int, int> ans = {};
    Set<int> people = {};
    for (var e in trust) {
      if (ans.containsKey(e[1])) {
        ans[e[1]] = ans[e[1]]! + 1;
      } else {
        ans[e[1]] = 1;
      }
      if (people.contains(e[0])) {
        return -1;
      }
      people.add(e[0]);
    }
    ans = Map.fromEntries(
        ans.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    if (ans.length == 1 &&
        !people.contains(ans.keys.first) &&
        ans.values.toList()[0] == n - 1) {
      return ans.keys.first;
    }
    if (ans.values.toList()[0] > ans.values.toList()[1] &&
        !people.contains(ans.keys.first) &&
        ans.values.toList()[0] == n - 1) {
      return ans.keys.first;
    }
    return -1;
  }
}
