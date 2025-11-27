class Solution {
  int largestSumAfterKNegations(List<int> nums, int k) {
    int sum(List<int> list) {
      int ans = 0;
      for (var e in list) {
        ans += e;
      }
      return ans;
    }

    int minNumberIndex(List<int> list) {
      int ans = 0;
      int temp = list[0];
      for (var i = 0; i < list.length; i++) {
        if (temp > list[i]) {
          ans = i;
          temp = list[i];
        }
      }
      return ans;
    }

    for (var i = 0; i < k; i++) {
      int temp = minNumberIndex(nums);
      nums[temp] = -nums[temp];
    }

    int ans = sum(nums);

    return ans;
  }
}
