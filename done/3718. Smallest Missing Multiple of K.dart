class Solution {
  int missingMultiple(List<int> nums, int k) {
    Set<int> numSet = nums.toSet();
    int missingMultiple = 1;
    while (true) {
      int candidate = missingMultiple * k;
      if (!numSet.contains(candidate)) {
        return candidate;
      }
      missingMultiple++;
    }
  }
}
