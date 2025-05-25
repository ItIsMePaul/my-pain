class Solution {
  bool checkSubarraySum(List<int> nums, int k) {
    if (nums.length < 2) return false;
    for (var i = nums.length; i >= 2; i--) {
      int sum = nums.sublist(0, i).fold(0, (a, b) => a + b);
      for (var j = 0; j <= nums.length - i; j++) {
        if (sum % k == 0) return true;
        sum -= nums[j];
        if (j + i < nums.length) {
          sum += nums[j + i];
        } else {
          break;
        }
      }
    }
    return false;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.checkSubarraySum([23, 2, 4, 6, 7], 6)); // true
  print(solution.checkSubarraySum([23, 2, 4, 6, 7], 13)); // false
  print(solution.checkSubarraySum([0, 0], 0)); // true
}
