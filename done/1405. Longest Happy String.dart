class Solution {
  String findDifferentBinaryString(List<String> nums) {
    StringBuffer result = StringBuffer();
    for (var i = 0; i < nums.length; i++)
      result.write(nums[i][i] == '0' ? '1' : '0');
    return result.toString();
  }
}
