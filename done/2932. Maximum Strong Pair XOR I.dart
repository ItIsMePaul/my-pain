class Solution {
  int maximumStrongPairXor(List<int> nums) {
    int abs(int num) {
      return num > 0 ? num : -1 * num;
    }

    int min(int a, int b) {
      return a > b ? b : a;
    }

    int ans = -1;
    for (var i = 0; i < nums.length; i++) {
      for (var j = 0; j < nums.length; j++) {
        if (abs(nums[i] - nums[j]) <= min(nums[i], nums[j])) {
          int temp = nums[i] ^ nums[j];
          if (temp > ans) {
            ans = temp;
          }
        }
      }
    }

    return ans;
  }
}
