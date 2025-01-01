class Solution {
  List<int> distinctDifferenceArray(List<int> nums) {
    List<int> ans = [];
    for (var i = 0; i < nums.length; i++) {
      int temp1 = nums.sublist(0, i + 1).toSet().length;
      int temp2 = nums.sublist(i + 1).toSet().length;
      ans.add(temp1 - temp2);
    }
    return ans;
  }
}
