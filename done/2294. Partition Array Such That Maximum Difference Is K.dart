class Solution {
  int partitionArray(List<int> nums, int k) {
    nums.sort();
    int count = 0;
    int firstElement = nums.first;
    for (var i = 1; i < nums.length; i++) {
      if (nums[i] - firstElement > k) {
        firstElement = nums[i];
        count++;
      }
    }
    return count;
  }
}
