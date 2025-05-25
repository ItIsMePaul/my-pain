class Solution {
  int subarraysDivByK(List<int> nums, int k) {
    int result = 0;
    for (var i = 0; i < nums.length; i++) {
      int sum = 0;
      for (var j = i; j < nums.length; j++) {
        sum += nums[j];
        if (sum % k == 0) result++;
      }
    }
    return result;
  }
}
