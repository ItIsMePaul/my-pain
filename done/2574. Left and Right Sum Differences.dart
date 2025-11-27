class Solution {
  List<int> leftRightDifference(List<int> nums) {
    List<int> leftSum = [];
    List<int> rightSum = [];
    int left = 0;
    int right = 0;

    int i = 0;
    do {
      leftSum.add(left);
      rightSum.insert(0, right);
      left += nums[i];
      right += nums[nums.length - 1 - i];
      i++;
    } while (i < nums.length);

    List<int> diffArray = [];
    int diff = 0;
    for (var i = 0; i < leftSum.length; i++) {
      diff = leftSum[i] - rightSum[i];
      if (diff < 0) {
        diffArray.add(-diff);
      } else {
        diffArray.add(diff);
      }
    }

    return diffArray;
  }
}
