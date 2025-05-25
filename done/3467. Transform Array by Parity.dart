class Solution {
  List<int> transformArray(List<int> nums) {
    List<int> ans = [];
    for (var num in nums) num % 2 == 0 ? ans.insert(0, 0) : ans.add(1);
    return ans;
  }
}
