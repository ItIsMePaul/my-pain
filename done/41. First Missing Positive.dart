class Solution {
  int firstMissingPositive(List<int> nums) {
    Set<int> set = nums.toSet();
    int result = 1;
    while (set.contains(result)) {
      result++;
    }
    return result;
  }
}
