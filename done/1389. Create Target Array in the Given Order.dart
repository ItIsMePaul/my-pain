class Solution {
  List<int> createTargetArray(List<int> nums, List<int> index) {
    List<int> ans = [];
    for (var i in index) {
      ans.insert(i, nums[0]);
      nums.removeAt(0);
    }
    return ans;
  }
}
