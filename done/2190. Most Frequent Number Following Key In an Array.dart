class Solution {
  int mostFrequent(List<int> nums, int key) {
    Map<int, int> results = {};
    for (var i = 0; i < nums.length - 1; i++) {
      if (nums[i] == key) {
        if (results.containsKey(nums[i + 1])) {
          int? temp = results[nums[i + 1]];
          temp = temp! + 1;
          results[nums[i + 1]] = temp;
        } else {
          results[nums[i + 1]] = 1;
        }
      }
    }
    int pos = 0;
    int max = -1;
    for (var i = 0; i < results.values.toList().length; i++) {
      if (results.values.toList()[i] > max) {
        pos = i;
        max = results.values.toList()[i];
      }
    }
    return results.keys.toList()[pos];
  }
}
