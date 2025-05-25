class Solution {
  List<int> pivotArray(List<int> nums, int pivot) {
    List<int> right = [];
    List<int> left = [];
    List<int> center = [];
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] < pivot) {
        left.add(nums[i]);
      } else if (nums[i] > pivot) {
        right.add(nums[i]);
      } else {
        center.add(nums[i]);
      }
    }
    return left + center + right;
  }
}