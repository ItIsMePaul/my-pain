class Solution {
  bool divideArray(List<int> nums) {
    Map<int, int> map = {};
    for (var num in nums) map[num] = (map[num] ?? 0) + 1;
    for (var val in map.values) {
      if (val % 2 != 0) {
        return false;
      }
    }
    return true;
  }
}
