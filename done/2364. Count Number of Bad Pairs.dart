class Solution {
  int countBadPairs(List<int> nums) {
    int ans = 0;
    Map<int, int> goodPairsCounter = {};
    for (var i = 0; i < nums.length; i++) {
      goodPairsCounter[nums[i] - i] = (goodPairsCounter[nums[i] - i] ?? 0) + 1;
    }
    for (var num in goodPairsCounter.values) {
      if (num > 1) ans += num * (num - 1) ~/ 2;
    }
    return (nums.length * (nums.length - 1) ~/ 2) - ans;
  }
}
