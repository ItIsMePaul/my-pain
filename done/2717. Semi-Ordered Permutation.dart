class Solution {
  int semiOrderedPermutation(List<int> nums) {
    int p = 0, swaps = 0;
    while (nums.first != 1) {
      if (nums[p] == 1) {
        nums.replaceRange(p, p + 1, [nums[p - 1]]);
        nums.replaceRange(p - 1, p, [1]);
        swaps++;
        p = 0;
        continue;
      }
      p++;
    }
    while (nums.last != nums.length) {
      if (nums[p] == nums.length) {
        nums.replaceRange(p, p + 1, [nums[p + 1]]);
        nums.replaceRange(p + 1, p + 2, [nums.length]);
        swaps++;
        p = 0;
        continue;
      }
      p++;
    }
    return swaps;
  }
}
