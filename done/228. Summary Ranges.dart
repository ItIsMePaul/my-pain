class Solution {
  List<String> summaryRanges(List<int> nums) {
    if (nums.isEmpty) return [];
    List<String> ans = [];
    List<int> temp = [nums[0], nums[0]];
    for (var i = 1; i < nums.length; i++) {
      if (nums[i] == nums[i - 1] + 1) {
        temp[1] = nums[i];
      } else {
        if (temp[1] == temp[0]) {
          ans.add('${temp[0]}');
        } else {
          ans.add('${temp[0]}->${temp[1]}');
        }
        temp = [nums[i], nums[i]];
      }
    }
    if (temp[1] == temp[0]) {
      ans.add('${temp[0]}');
    } else {
      ans.add('${temp.first}->${temp.last}');
    }
    return ans;
  }
}