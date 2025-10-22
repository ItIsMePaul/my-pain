class Solution {
  int specialArray(List<int> nums) {
    nums.sort();
    Map<int, int> map = {};
    for (var i = 0; i <= nums.last; i++) {
      int c = 0;
      for (var j = 0; j < nums.length; j++) {
        if (nums[j] >= i) {
          c++;
        }
      }
      map[i] = c;
    }
    print(map);
    for (var i = nums.last; i >= 0; i--) {
      if (map[i] == i) {
        return i;
      }
    }
    return -1;
  }
}
