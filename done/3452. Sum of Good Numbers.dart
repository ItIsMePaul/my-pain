class Solution {
  int sumOfGoodNumbers(List<int> nums, int k) {
    int ans = 0;
    for (var i = 0; i < nums.length; i++) {
      int left = i - k;
      int right = i + k;
      if ((left >= 0 && nums[i] <= nums[left]) ||
          (right < nums.length && nums[i] <= nums[right])) {
        continue;
      }
      ans += nums[i];
    }
    return ans;
  }
}

/*
Input: nums = [1,3,2,1,5,4], k = 2

Output: 12

Explanation:

The good numbers are nums[1] = 3, nums[4] = 5, and nums[5] = 4 
because they are strictly greater than the numbers at indices i - k and i + k.
*/