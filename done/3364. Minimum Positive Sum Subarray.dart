class Solution {
  int minimumSumSubarray(List<int> nums, int l, int r) {
    int ans = 100 * 1000 + 1;
    for (var i = l; i <= r; i++) {
      for (var j = 0; j <= nums.length - i; j++) {
        int temp = 0;
        for (var e in nums.sublist(j, j + i)) {
          temp += e;
        }
        if (temp > 0 && temp < ans) {
          ans = temp;
        }
      }
    }
    return ans == 100 * 1000 + 1 ? -1 : ans;
  }
}
