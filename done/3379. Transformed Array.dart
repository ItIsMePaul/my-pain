class Solution {
  List<int> constructTransformedArray(List<int> nums) {
    List<int> ans = [];
    int pos = 0;
    for (var e in nums) {
      int temp = 0;
      temp += (pos + e) % nums.length;
      temp = temp >= 0 ? temp : nums.length - temp;
      ans.add(nums[temp]);
      pos++;
    }
    return ans;
  }
}
