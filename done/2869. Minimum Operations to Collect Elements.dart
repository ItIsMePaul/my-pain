class Solution {
  int minOperations(List<int> nums, int k) {
    bool containRequiredNumbers(List<int> nums, int k) {
      for (var i = 1; i <= k; i++) {
        if (!nums.contains(i)) {
          return true;
        }
      }
      return false;
    }

    List<int> collectedNums = [];
    int ans = 0;
    bool pass = true;
    while (pass) {
      collectedNums.add(nums.last);
      nums.removeLast();
      pass = containRequiredNumbers(collectedNums, k);
      ans++;
    }
    return ans;
  }
}
