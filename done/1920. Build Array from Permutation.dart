class Solution {
  List<int> buildArray(List<int> nums) {
    List<int> ans = [];
    for (var i = 0; i < nums.length; i++) ans.add(nums[nums[i]]);
    return ans;
  }
}
