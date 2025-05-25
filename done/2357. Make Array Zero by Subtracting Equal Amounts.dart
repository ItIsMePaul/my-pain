class Solution {
  int minimumOperations(List<int> nums) {
    nums.removeWhere((item) => item == 0);
    nums.sort();
    int ans = 0;
    while (nums.isNotEmpty) {
      int remove = nums.first;
      for (var j = 0; j < nums.length; j++) {
        nums[j] -= remove;
      }
      ans++;
      nums.removeWhere((item) => item == 0);
    }
    return ans;
  }
}
