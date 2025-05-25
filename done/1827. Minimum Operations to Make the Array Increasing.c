int minOperations(int* nums, int numsSize) {
    int ans = 0;
    for(int i = 0; i < numsSize - 1; i++) {
      if (nums[i] >= nums[i + 1]) {
        int temp = nums[i] - nums[i + 1] + 1;
        nums[i + 1] += temp;
        ans += temp;
      }
    }
    return ans;
  }