class Solution {
  List<int> productExceptSelf(List<int> nums) {
    int zeros = 0;
    int zeroPos = 0;
    int product = 1;
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == zeros) {
        zeros++;
        zeroPos = i;
      } else {
        product *= nums[i];
      }
    }
    List<int> ans = List.filled(nums.length, 0);
    if (zeros > 1) return ans;
    if (zeros == 1) {
      ans[zeroPos] = product;
      return ans;
    }
    int preffix = 1;
    for (var i = 0; i < nums.length; i++) {
      ans[i] = preffix;
      preffix *= nums[i];
    }
    int suffix = 1;
    for (var i = nums.length - 1; i >= 0; i--) {
      ans[i] *= suffix;
      suffix *= nums[i];
    }
    return ans;
  }
}
