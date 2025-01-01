class Solution {
  List<int> runningSum(List<int> nums) {
    int sum = 0;
    List<int> ans = [];
    for (var num in nums) {
      sum += num;
      ans.add(sum);
    }
    return ans;
  }
}
