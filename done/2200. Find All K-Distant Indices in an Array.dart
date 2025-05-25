class Solution {
  List<int> findKDistantIndices(List<int> nums, int key, int k) {
    List<int> result = [];
    List<int> keysIDs = [];
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] == key) {
        keysIDs.add(i);
      }
    }
    for (var i = 0; i < nums.length; i++) {
      for (var j in keysIDs) {
        if ((i - j).abs() <= k) {
          result.add(i);
          break;
        }
      }
    }
    return result;
  }
}
