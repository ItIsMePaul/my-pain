class Solution {
  int maximumTripletValue(List<int> nums) {
    int ans = 0;
    for (var i = 0; i < nums.length - 2; i++) {
      for (var j = i + 1; j < nums.length - 1; j++) {
        for (var k = j + 1; k < nums.length; k++) {
          int temp = (nums[i] - nums[j]) * nums[k];
          if (temp > ans) {
            ans = temp;
          }
        }
      }
    }
    return ans;
  }
}
