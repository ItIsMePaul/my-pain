class Solution {
  int getMinDistance(List<int> nums, int target, int start) {
    int temp1 = 0;
    int temp2 = 0;
    for (var i = start; i < nums.length; i++) {
      if (nums[i] == target) {
        temp1 = i - start;
        break;
      }
    }
    for (var i = start; i >= 0; i--) {
      if (nums[i] == target) {
        temp2 = start - i;
        break;
      }
    }

    return temp1 > temp2 ? temp2 : temp1;
  }
}
