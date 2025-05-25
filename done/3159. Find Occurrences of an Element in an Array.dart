class Solution {
  List<int> occurrencesOfElement(List<int> nums, List<int> queries, int x) {
    List<int> ans = [];
    Map<int, int> map = {};
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == x) {
        map[++count] = i;
      }
    }
    for (var query in queries) {
      ans.add(map[query] ?? -1);
    }
    return ans;
  }
}
