class Solution {
  int dominantIndex(List<int> nums) {
    int previousBiggestIndex;
    int biggestIndex;
    nums[0] > nums[1] ? previousBiggestIndex = 1 : previousBiggestIndex = 0;
    nums[0] > nums[1] ? biggestIndex = 0 : biggestIndex = 1;
    for (var i = 2; i < nums.length; i++) {
      if (nums[i] > nums[biggestIndex]) {
        previousBiggestIndex = biggestIndex;
        biggestIndex = i;
        continue;
      }
      if (nums[i] > nums[previousBiggestIndex] &&
          previousBiggestIndex != biggestIndex) {
        previousBiggestIndex = i;
      }
    }
    if (nums[previousBiggestIndex] == 0) return biggestIndex;
    return nums[biggestIndex] ~/ nums[previousBiggestIndex] >= 2
        ? biggestIndex
        : -1;
  }
}
