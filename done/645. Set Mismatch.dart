class Solution {
  List<int> findErrorNums(List<int> nums) {
    Map<int, int> map = {};
    for (var i = 0; i < nums.length; i++) {
      map[nums[i]] = (map[nums[i]] ?? 0) + 1;
    }
    int dup = 0, missing = 0;
    for (var i = 1; i <= nums.length; i++) {
      if (map.containsKey(i)) {
        if (map[i] == 2) {
          dup = i;
        }
      } else {
        missing = i;
      }
    }
    return [dup, missing];
  }
}
