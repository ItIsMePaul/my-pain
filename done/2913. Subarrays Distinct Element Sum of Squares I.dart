class Solution {
  int sumCounts(List<int> nums) {
    int ans = 0;
    for (var i = 1; i <= nums.length; i++) {
      for (var j = 0; j + i <= nums.length; j++) {
        int temp = nums.sublist(j, j + i).toSet().length;
        ans += temp * temp;
      }
    }
    return ans;
  }
}
