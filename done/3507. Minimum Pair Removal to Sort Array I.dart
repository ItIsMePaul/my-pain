class Solution {
  int minimumPairRemoval(List<int> nums) {
    int removeOperationCounter = 0;
    bool _isSorted(List<int> nums) {
      for (var i = 0; i < nums.length - 1; i++) {
        if (nums[i] > nums[i + 1]) return false;
      }
      return true;
    }

    while (!_isSorted(nums)) {
      int minSumPos = 0;
      int minSumValue = 1000000;
      for (var i = 0; i < nums.length - 1; i++) {
        if (nums[i] + nums[i + 1] < minSumValue) {
          minSumValue = nums[i] + nums[i + 1];
          minSumPos = i;
        }
      }
      nums.replaceRange(minSumPos, minSumPos + 2, [
        nums[minSumPos] + nums[minSumPos + 1],
      ]);

      removeOperationCounter++;
    }
    return removeOperationCounter;
  }
}
