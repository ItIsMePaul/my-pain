class Solution {
  int xorAfterQueries(List<int> nums, List<List<int>> queries) {
    for (var query in queries) {
      int idx = query[0];
      while (idx <= query[1]) {
        nums[idx] = (nums[idx] * query[3]) % (1000000000 + 7);
        idx += query[2];
      }
    }
    int result = nums[0];
    for (var i = 1; i < nums.length; i++) {
      result ^= nums[i];
    }
    return result;
  }
}
