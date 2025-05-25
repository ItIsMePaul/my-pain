class Solution {
  int tupleSameProduct(List<int> nums) {
    int ans = 0;
    Map<int, int> map = {};
    for (var i = 0; i < nums.length; i++) {
      for (var j = i + 1; j < nums.length; j++) {
        int product = nums[i] * nums[j];
        map[product] = (map[product] ?? 0) + 1;
      }
    }
    for (var val in map.values) {
      if (val > 1) ans += val * 4 * (val - 1);
    }
    return ans;
  }
}
