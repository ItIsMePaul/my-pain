class Solution {
  List<int> findPrefixScore(List<int> nums) {
    List<int> ans = [];
    int max = 0;
    int sum = 0;
    for (var num in nums) {
      if (num > max) max = num;
      sum += num + max;
      ans.add(sum);
    }
    return ans;
  }
}
