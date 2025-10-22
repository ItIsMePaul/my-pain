class Solution {
  int evenNumberBitwiseORs(List<int> nums) {
    int result = 0;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] % 2 == 0) result = result | nums[i];
    }
    return result;
  }
}
