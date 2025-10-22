class Solution {
  List<int> sortArrayByParity(List<int> nums) {
    List<int> fnums = [];
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] % 2 == 0) {
        fnums.insert(0, nums[i]);
      } else {
        fnums.add(nums[i]);
      }
    }
    return fnums;
  }
}
