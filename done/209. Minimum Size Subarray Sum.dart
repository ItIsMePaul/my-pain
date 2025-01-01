class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    int firstPoint = 0;
    int lastPoint = 1;
    int ans = 100001;
    int temp = nums[firstPoint];
    for (var i = 0; firstPoint != nums.length; i++) {
      if (temp >= target) {
        if (lastPoint - firstPoint < ans) {
          ans = lastPoint - firstPoint;
        }
        temp -= nums[firstPoint++];
      } else {
        if (lastPoint + 1 > nums.length) break;
        temp += nums[lastPoint++];
      }
    }
    return ans == 100001 ? 0 : ans;
  }
}
