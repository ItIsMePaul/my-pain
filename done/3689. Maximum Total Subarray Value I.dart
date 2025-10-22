class Solution {
  int maxTotalValue(List<int> nums, int k) {
    int min = nums.first;
    int max = nums.first;
    for (var i = 0; i < nums.length; i++) {
      if (min > nums[i]) min = nums[i];
      if (max < nums[i]) max = nums[i];
    }
    return (max - min) * k;
  }
}
